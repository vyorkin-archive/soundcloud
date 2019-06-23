module SoundCloud.Component.HTML.Track.Style
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
  , title ∷ String
  , artwork ∷ String
  , duration ∷ String
  , playbacks ∷ String
  , favoritings ∷ String
  , comments ∷ String
  , permalink ∷ String
  , actions ∷ String
  }

classNames ∷ ClassNames
classNames = scoped "track"
  { root: "root"
  , title: "title"
  , artwork: "artwork"
  , duration: "duration"
  , playbacks: "playbacks"
  , favoritings: "favoritings"
  , comments: "comments"
  , permalink: "permalink"
  , actions: "actions"
  }

stylesheet ∷ Rendered
stylesheet = render do
  className_ classNames.root ? do
    pure unit
  className_ classNames.title ? do
    pure unit
  className_ classNames.artwork ? do
    pure unit
  className_ classNames.duration ? do
    pure unit
  className_ classNames.playbacks ? do
    pure unit
  className_ classNames.favoritings ? do
    pure unit
  className_ classNames.comments ? do
    pure unit
  className_ classNames.permalink ? do
    pure unit
  className_ classNames.actions ? do
    pure unit
