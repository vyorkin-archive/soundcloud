module SoundCloud.Component.HTML.TrackList.Style
  ( ClassNames
  , classNames
  , stylesheet
  ) where

import CSS

import CSS.Border as Border
import CSS.Common (center)
import CSS.Cursor as Cursor
import CSS.Text.Transform (uppercase)
import Prelude (pure, unit, discard, ($))
import SoundCloud.CSS (className_, margin_, padding_, scoped)
import SoundCloud.Style.Base16 as Base16
import SoundCloud.Style.Color as Color
import SoundCloud.Style.Typography (fontSizes, fontWeights)

type ClassNames =
  { root ∷ String
  }

classNames ∷ ClassNames
classNames = scoped "track-list"
  { root: "root"
  }

stylesheet ∷ Rendered
stylesheet = render do
  className_ classNames.root ? do
    pure unit
