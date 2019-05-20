module SoundCloud.Component
  ( stylesheet
  ) where

import Prelude

import CSS (Rendered)
import SoundCloud.Component.Navigation as Navigation
import SoundCloud.Component.Root as Root

stylesheet ∷ Rendered
stylesheet
   = Root.stylesheet
  <> Navigation.stylesheet
