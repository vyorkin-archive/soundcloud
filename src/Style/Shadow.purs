module SoundCloud.Style.Shadow
  ( shadowSm
  , shadowLg
  , shadowXl
  , shadowInner
  , shadowOutline
  ) where

import Prelude

import CSS (CSS, boxShadow, nil, px, rgba)
import CSS.Box (bsColor, shadowWithBlur, shadowWithSpread)
import Data.NonEmpty ((:|))
import SoundCloud.CSS.Box (boxShadowInset_, boxShadow_)

shadowSm ∷ CSS
shadowSm = boxShadow_ $ (rgba 0 0 0 0.10) `bsColor` shadowWithBlur nil (px 2.0) (px 4.0)

shadowLg ∷ CSS
shadowLg =
  boxShadow
  $ (rgba 0 0 0 0.12) `bsColor` shadowWithBlur nil (px 4.0) (px 8.0) :|
  [ (rgba 0 0 0 0.08) `bsColor` shadowWithBlur nil (px 2.0) (px 4.0)
  ]

shadowXl ∷ CSS
shadowXl =
  boxShadow
  $ (rgba 0 0 0 0.11) `bsColor` shadowWithBlur nil (px 15.0) (px 30.0) :|
  [ (rgba 0 0 0 0.08) `bsColor` shadowWithBlur nil (px 5.0) (px 15.0)
  ]

shadowInner ∷ CSS
shadowInner = boxShadowInset_ $ (rgba 0 0 0 0.15) `bsColor` shadowWithBlur nil (px 2.0) (px 4.0)

shadowOutline ∷ CSS
shadowOutline = boxShadow_ $ (rgba 52 144 220 0.5) `bsColor` shadowWithSpread nil nil nil (px 3.0)
