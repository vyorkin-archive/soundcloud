module SoundCloud.Component.Root where

import Prelude

import Control.Monad.Reader (class MonadAsk)
import Data.Either.Nested (type (\/))
import Data.Functor.Coproduct.Nested (type (<\/>))
import Data.Maybe (Maybe(..), fromMaybe)
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.HTML as HH
import Prelude.Unicode ((≢))
import SoundCloud.Capability.Logging (class Logging)
import SoundCloud.Capability.Now (class Now)
import SoundCloud.Data.Route (Route)
import SoundCloud.Data.Route as Route
import SoundCloud.Env (Env)
import SoundCloud.Page.About as About
import SoundCloud.Page.Home as Home

type Routing =
  { current ∷ Route
  , previous ∷ Maybe Route
  }

type State =
  { route ∷ Routing
  }

data Query a
  = Initialize a
  | Finalize a
  | Navigate Route a

type Input = Maybe Route

type Output = Void

type ChildQuery
  = Home.Query
  <\/> About.Query

type ChildSlot
  = Home.Slot
  \/ About.Slot

type WithCapabilities c m
  = MonadAff m
  ⇒ MonadAsk Env m
  ⇒ Now m
  ⇒ Logging m
  ⇒ c m

type Component' m = H.Component HH.HTML Query Input Output m
type Component  m = WithCapabilities Component' m

type DSL m  = H.ParentDSL State Query ChildQuery ChildSlot Output m
type HTML m = H.ParentHTML Query ChildQuery ChildSlot m

component ∷ ∀ m. Component m
component = H.lifecycleParentComponent
  { initialState
  , render
  , eval
  , receiver: const Nothing
  , initializer: Just $ H.action Initialize
  , finalizer: Just $ H.action Finalize
  }
  where
  initialState ∷ Input → State
  initialState route =
    { route: { previous: Nothing
             , current: fromMaybe Route.Home route
             }
    }

  eval ∷ Query ~> DSL m
  eval = case _ of
    Initialize a → pure a
    Finalize a → pure a
    Navigate next a → do
      { current, previous } ← H.gets _.route
      when (current ≢ next) do
        let route = { current: next, previous: Just current }
        H.modify_ _ { route = route }
      pure a

  render ∷ State → HTML m
  render state =
    HH.div_
    [ HH.text "root component" ]
