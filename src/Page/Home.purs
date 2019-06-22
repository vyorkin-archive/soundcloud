module SoundCloud.Page.Home
  ( Component
  , HTML
  , State
  , Action
  , page
  ) where

import Prelude

import Halogen as H
import Halogen.HTML as HH

type State = Unit
type Action = Unit

type Component m = ∀ q i o. H.Component HH.HTML q i o m
type HTML m = H.ComponentHTML Action () m

page ∷ ∀ m. Component m
page = H.mkComponent
  { initialState: const unit
  , render
  , eval: H.mkEval H.defaultEval
  }

render ∷ ∀ m. State → HTML m
render _ = HH.div_ [ HH.text "home page" ]
