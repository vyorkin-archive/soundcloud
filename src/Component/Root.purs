module SoundCloud.Component.Root where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH

data Query a = Unit a
type Input = Unit
type Output = Void
type State = Unit

type Component = H.Component HH.HTML Query Input Output
type DSL = H.ComponentDSL State Query Output
type HTML = H.ComponentHTML Query

root ∷ ∀ m. Component m
root = H.component
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
      [ HH.text "root component" ]
