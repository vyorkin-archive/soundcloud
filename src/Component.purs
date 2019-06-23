module SoundCloud.Component
  ( stylesheet
  ) where

import Prelude

import CSS (Rendered)
import SoundCloud.Component.HTML as HTML
import SoundCloud.Component.Navigation as Navigation
import SoundCloud.Component.Root as Root
import SoundCloud.Component.Player as Player

stylesheet ∷ Rendered
stylesheet
   = HTML.stylesheet
  <> Root.stylesheet
  <> Navigation.stylesheet
  <> Player.stylesheet
