module SoundCloud.Style where

import Prelude
import CSS (Rendered)
import SoundCloud.Style.Font as Font
import SoundCloud.Style.Base as Base
import SoundCloud.Style.Typography as Typography
import SoundCloud.Page as Page
import SoundCloud.Component as Component

stylesheet ∷ Rendered
stylesheet
   = Font.stylesheet
  <> Base.stylesheet
  <> Typography.stylesheet
  <> Page.stylesheet
  <> Component.stylesheet
