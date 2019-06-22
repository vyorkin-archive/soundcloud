module SoundCloud.Sandbox.Row1 where

import Type.Row (type (+))

type Rows1 r = (a ∷ Int, b ∷ String | r)
type Rows2 r = (c ∷ Boolean | r)
type Rows3 r = (Rows1 + Rows2 + r)
