module SoundCloud.Page.About
  ( Component
  , HTML
  , Action
  , component
  , module SoundCloud.Page.About.Style
  ) where

import Prelude

import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect)
import Halogen as H
import Halogen.HTML as HH
import SoundCloud.HTML.Util (css)
import SoundCloud.Page.About.Style (classNames, stylesheet)

type State = Unit
type Action = Unit

type Component m = ∀ q i o. H.Component HH.HTML q i o m
type HTML m = H.ComponentHTML Action () m

type WithCapabilities c m
  = MonadEffect m
  ⇒ MonadAff m
  ⇒ c m

component ∷ ∀ m. WithCapabilities Component m
component = H.mkComponent
  { initialState: const unit
  , render
  , eval: H.mkEval H.defaultEval
  }

render ∷ ∀ m. State → HTML m
render _ =
  HH.div
  [ css [classNames.root] ]
  [ HH.text "about" ]
