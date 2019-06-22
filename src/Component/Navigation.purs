module SoundCloud.Component.Navigation
  ( Options
  , Component
  , HTML
  , Input
  , Action
  , navigation
  , module SoundCloud.Component.Navigation.Style
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Monoid (guard)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Prelude.Unicode ((∘), (≡))
import SoundCloud.Capability.Navigation (class Navigation, navigate)
import SoundCloud.Component.Navigation.Style (classNames, stylesheet)
import SoundCloud.Data.Route (Route)
import SoundCloud.Data.Route as Route
import SoundCloud.HTML.Util (css)

type Options =
  { title ∷ String
  }

data Action
  = Initialize
  | Receive Input
  | Navigate Route

type Input =
  { route ∷ Route
  }

type State = Input

type Component m = ∀ q. H.Component HH.HTML q Input Void m
type HTML m = H.ComponentHTML Action () m

type ActionHandler m = Action → H.HalogenM State Action () Void m Unit

navigation ∷ ∀ m. Navigation m ⇒ Options → Component m
navigation { title } = H.mkComponent
  { initialState: identity
  , render
  , eval: H.mkEval $ H.defaultEval
    { handleAction = handleAction
    , initialize = Just Initialize
    , receive = Just ∘ Receive
    }
  }
  where
  render ∷ State → HTML m
  render state =
    HH.nav
    [ css [classNames.root] ]
    [ HH.a
      [ css [classNames.title]
      , HE.onClick \_ → Just $ Navigate Route.Home
      ]
      [ HH.text title ]
    , HH.ul
      [ css [classNames.menu] ]
      ( renderItem <$> navRoutes )
    ]
    where
    renderItem ∷ Route → HTML m
    renderItem route =
      let cls = guard (route ≡ state.route) [classNames.menuItemActive]
      in HH.li
         [ css $ [classNames.menuItem] <> cls
         , HE.onClick \_ → Just $ Navigate route
         ]
         [ HH.text $ Route.toTitle route ]

  handleAction ∷ ActionHandler m
  handleAction = case _ of
    Initialize →
      pure unit
    Receive { route } →
      H.modify_ _ { route = route }
    Navigate route →
      navigate route

navRoutes ∷ Array Route
navRoutes =
  [ Route.Home
  , Route.About
  ]
