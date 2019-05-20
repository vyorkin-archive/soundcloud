module SoundCloud.Component.Navigation
  ( Options
  , Query(..)
  , Input
  , Output
  , Slot(..)
  , navigation
  , module SoundCloud.Component.Navigation.Style
  ) where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import SoundCloud.Capability.Navigation (class Navigation, navigate)
import SoundCloud.Component.Navigation.Style (classNames, stylesheet)
import SoundCloud.Data.Route (Route)
import SoundCloud.HTML.Util (css)

type Options =
  { title ∷ String
  }

data Query a
  = Navigate Route a
  | HandleInput Input a

type Input =
  { route ∷ Route
  }

type Output = Void
type State = Input

data Slot = Slot
derive instance eqSlot ∷ Eq Slot
derive instance ordSlot ∷ Ord Slot

type Component = H.Component HH.HTML Query Input Output
type DSL = H.ComponentDSL State Query Output
type HTML = H.ComponentHTML Query

navigation ∷ ∀ m . Navigation m ⇒ Options → Component m
navigation { title } = H.component
  { initialState: identity
  , render
  , eval
  , receiver: HE.input HandleInput
  }
  where
  eval ∷ Query ~> DSL m
  eval = case _ of
    HandleInput input a → H.put input $> a
    Navigate route a → navigate route $> a

  render ∷ State → HTML
  render state =
    HH.nav
    [ css [classNames.root] ]
    [
    ]
