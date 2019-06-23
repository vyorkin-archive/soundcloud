module SoundCloud.Component.HTML.Playlist.Style
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
  , header ∷ String
  , content ∷ String
  , item ∷ String
  , itemArtwork ∷ String
  , itemTitle ∷ String
  , itemActions ∷ String
  }

classNames ∷ ClassNames
classNames = scoped "playlist"
  { root: "root"
  , header: "header"
  , content: "content"
  , item: "item"
  , itemArtwork: "item-artwork"
  , itemTitle: "item-title"
  , itemActions: "item-actions"
  }

stylesheet ∷ Rendered
stylesheet = render do
  className_ classNames.root ? do
    pure unit
  className_ classNames.header ? do
    pure unit
  className_ classNames.content ? do
    pure unit
  className_ classNames.item ? do
    pure unit
  className_ classNames.itemArtwork ? do
    pure unit
  className_ classNames.itemTitle ? do
    pure unit
  className_ classNames.itemActions ? do
    pure unit
