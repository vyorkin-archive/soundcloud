module SoundCloud.Component.Root
  ( IO
  , Routing
  , State
  , Query(..)
  , Action(..)
  , Input
  , Output
  , Component'
  , component
  , module SoundCloud.Component.Root.Style
  ) where

import Prelude

import Control.Monad.Reader (class MonadAsk)
import Data.Maybe (Maybe(..), fromMaybe)
import Effect.Aff (Aff)
import Effect.Aff.Class (class MonadAff)
import Halogen (HalogenIO)
import Halogen as H
import Halogen.HTML as HH
import Prelude.Unicode ((≢))
import SoundCloud.Capability.Logging (class Logging)
import SoundCloud.Capability.Navigation (class Navigation)
import SoundCloud.Capability.Now (class Now)
import SoundCloud.Capability.Resource.Track (class TrackGateway)
import SoundCloud.Component.Navigation (navigation)
import SoundCloud.Component.Root.Style (classNames, stylesheet)
import SoundCloud.Component.Util (OpaqueSlot)
import SoundCloud.Data.Route (Route)
import SoundCloud.Data.Route as Route
import SoundCloud.Env (Env)
import SoundCloud.HTML.Util (css)
import SoundCloud.Page.About as About
import SoundCloud.Page.Home as Home
import Type.Prelude (SProxy(..))

type IO = HalogenIO Query Output Aff

type Routing =
  { current ∷ Route
  , previous ∷ Maybe Route
  }

type State =
  { route ∷ Routing
  }

data Query a = Navigate Route a
data Action = Initialize
type Input = Maybe Route
type Output = Void

type ChildSlots =
  ( home ∷ OpaqueSlot Unit
  , about ∷ OpaqueSlot Unit
  , navigation ∷ OpaqueSlot Unit
  )

type WithCapabilities c m
  = MonadAff m
  ⇒ MonadAsk Env m
  ⇒ Now m
  ⇒ Logging m
  ⇒ Navigation m
  ⇒ TrackGateway m
  ⇒ c m

type Component' m = H.Component HH.HTML Query Input Output m
type Component  m = WithCapabilities Component' m
type HTML m = H.ComponentHTML Action ChildSlots m

type QueryHandler m = ∀ a. Query a → H.HalogenM State Action ChildSlots Void m (Maybe a)
type ActionHandler m = Action → H.HalogenM State Action ChildSlots Void m Unit

component ∷ ∀ m. Component m
component = H.mkComponent
  { initialState
  , render
  , eval: H.mkEval $ H.defaultEval
    { handleAction = handleAction
    , handleQuery = handleQuery
    , initialize = Just Initialize
    }
  }
  where
  initialState ∷ Input → State
  initialState route =
    { route: { previous: Nothing
             , current: fromMaybe Route.Home route
             }
    }

  handleAction ∷ ActionHandler m
  handleAction = case _ of
    Initialize → do
      pure unit

  handleQuery ∷ QueryHandler m
  handleQuery = case _ of
    Navigate next a → do
      { current, previous } ← H.gets _.route
      when (current ≢ next) do
        let route = { current: next, previous: Just current }
        H.modify_ _ { route = route }
      pure $ Just a

  render ∷ State → HTML m
  render state =
    HH.div
    [ css [classNames.root] ]
    [ renderNavigation state.route.current
    , HH.div
      [ css [classNames.content] ]
      [ renderPage state.route.current
      ]
    ]

  renderNavigation ∷ Route → HTML m
  renderNavigation route = HH.slot (SProxy ∷ _ "navigation") unit
      (navigation { title: "SoundCloud" })
      { route } absurd

  renderPage ∷ Route → HTML m
  renderPage = case _ of
    Route.Home  → HH.slot (SProxy ∷ _ "home") unit Home.component unit absurd
    Route.About → HH.slot (SProxy ∷ _ "about") unit About.component unit absurd
