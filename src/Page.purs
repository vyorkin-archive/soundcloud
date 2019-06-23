module SoundCloud.Page
  ( stylesheet
  ) where

import Prelude

import CSS (Rendered)
import SoundCloud.Page.Home as Home
import SoundCloud.Page.About as About

stylesheet ∷ Rendered
stylesheet
   = Home.stylesheet
  <> About.stylesheet
