module SoundCloud.CSS.Border
  ( borderColor'
  , borderRadius_
  , roundedFull
  , borderNone
  , outlineNone
  ) where

import Prelude

import CSS (CSS, Size, fromString, key, px)

borderColor' ∷ String → CSS
borderColor' = key $ fromString "border-color"

-- | Fully rounded border,
-- | useful for creating pills and circles.
roundedFull ∷ CSS
roundedFull = borderRadius_ $ px 9999.0

borderRadius_ ∷ ∀ a. Size a → CSS
borderRadius_ = key $ fromString "border-radius"

borderNone ∷ CSS
borderNone = key (fromString "border") "none"

outlineNone ∷ CSS
outlineNone = key (fromString "outline") "none"
