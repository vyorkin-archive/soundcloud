module SoundCloud.Style.Base
  ( stylesheet
  ) where

import CSS
import Prelude (discard, ($), (<>))

import CSS.Common (inherit)
import CSS.Cursor as Cursor
import Data.NonEmpty (NonEmpty, (:|))
import SoundCloud.Style.Font as Font

stylesheet ∷ Rendered
stylesheet = render do
  html ? do
    boxSizing borderBox
    fontFamily [] fonts
    fontSize $ pt 11.0
  (star <>
   (fromString "*:before") <>
   (fromString "*:after")) ? do
    boxSizing inherit
  button ? do
    cursor Cursor.pointer

fonts ∷ NonEmpty Array GenericFontFamily
fonts = Font.systemUI :|
  [ Font.blinkMacSystemFont
  , Font.appleSystem
  , Font.segoeUI
  , Font.roboto
  , Font.oxygen
  , Font.ubuntu
  , Font.cantarell
  , Font.firaSans
  , Font.droidSans
  , Font.helveticaNeue
  , sansSerif
  ]
