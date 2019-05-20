module SoundCloud.Style where

import Prelude
import CSS (Rendered)
import SoundCloud.Style.Font as Font
import SoundCloud.Style.Base as Base
import SoundCloud.Style.Typography as Typography
import SoundCloud.Component as Component

stylesheet ∷ Rendered
stylesheet
   = Font.stylesheet
  <> Base.stylesheet
  <> Typography.stylesheet
  <> Component.stylesheet
