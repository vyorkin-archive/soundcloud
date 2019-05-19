module SoundCloud.Style where

import Prelude
import CSS (Rendered)
import SoundCloud.Style.Font as Font
import SoundCloud.Style.Base as Base
import SoundCloud.Style.Typography as Typography

stylesheet ∷ Rendered
stylesheet
   = Font.stylesheet
  <> Base.stylesheet
  <> Typography.stylesheet
