module SoundCloud.CSS.Flexbox
  ( flexNone
  , flex1
  , flexX
  ) where

import Prelude (($), discard)
import CSS.Flexbox
import CSS (CSS, pct)
import CSS.Common (auto)

flexNone ∷ CSS
flexNone = flex 0 0 auto

flexX ∷ Int → CSS
flexX x = do
  flexGrow x
  flexShrink 1
  flexBasis $ pct 0.0

flex1 ∷ CSS
flex1 = flexX 1
