module SoundCloud.Style.Border
  ( borderRadiusSm
  , borderRadiusLg
  ) where

import Prelude (($))
import CSS
import SoundCloud.CSS.Border (borderRadius_)

borderRadiusSm ∷ CSS
borderRadiusSm = borderRadius_ $ rem 0.25

borderRadiusLg ∷ CSS
borderRadiusLg = borderRadius_ $ rem 0.5
