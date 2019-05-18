module SoundCloud.Page.About
  ( Query(..)
  , Input
  , Slot(..)
  , page
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH

data Query a = Unit a
type Input = Unit
type Output = Void
type State = Unit

data Slot = Slot
derive instance eqSlot ∷ Eq Slot
derive instance ordSlot ∷ Ord Slot

type Component = H.Component HH.HTML Query Input Output
type DSL = H.ComponentDSL State Query Output
type HTML = H.ComponentHTML Query

page ∷ ∀ m. Component m
page = H.component
  { initialState: const unit
  , render
  , eval
  , receiver: const Nothing
  }
  where
    eval ∷ Query ~> DSL m
    eval (Unit a) = pure a

    render ∷ State → HTML
    render _ =
      HH.div_
      [ HH.text "about page" ]
