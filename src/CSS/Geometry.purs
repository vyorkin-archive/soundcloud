module SoundCloud.CSS.Geometry
  ( marginX
  , marginY
  , marginYX
  , margin_
  , paddingX
  , paddingY
  , paddingYX
  , padding_
  , size
  , size_
  , pin
  ) where

import CSS
import Data.Tuple.Nested (tuple2)
import Prelude (discard, ($))

marginX ∷ ∀ a. Size a → CSS
marginX x = margin nil x nil x

marginY ∷ ∀ a. Size a → CSS
marginY y = margin y nil y nil

marginYX ∷ ∀ a. Size a → Size a → CSS
marginYX y x = key (fromString "margin") $ tuple2 y x

margin_ ∷ ∀ a. Size a → CSS
margin_ v = key (fromString "margin") (value v)

paddingX ∷ ∀ a. Size a → CSS
paddingX x = padding nil x nil x

paddingY ∷ ∀ a. Size a → CSS
paddingY y = padding y nil y nil

paddingYX ∷ ∀ a. Size a → Size a → CSS
paddingYX y x = key (fromString "padding") $ tuple2 y x

padding_ ∷ ∀ a. Size a → CSS
padding_ v = key (fromString "padding") (value v)

size ∷ ∀ a b. Size a → Size b → CSS
size w h = do
  width w
  height h

size_ ∷ ∀ a. Size a → CSS
size_ v = size v v

pin ∷ CSS
pin = do
  top nil
  right nil
  bottom nil
  left nil
