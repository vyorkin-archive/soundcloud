module SoundCloud.Component.Navigation.Style
  ( ClassNames
  , classNames
  , stylesheet
  ) where

import CSS

import CSS.Border as Border
import CSS.Common (center)
import CSS.Cursor as Cursor
import CSS.Text.Transform (uppercase)
import Prelude (discard, ($))
import SoundCloud.CSS (className_, margin_, padding_, scoped)
import SoundCloud.Style.Base16 as Base16
import SoundCloud.Style.Color as Color
import SoundCloud.Style.Typography (fontSizes, fontWeights)

type ClassNames =
  { root ∷ String
  , title ∷ String
  , menu ∷ String
  , menuItem ∷ String
  , menuItemActive ∷ String
  }

classNames ∷ ClassNames
classNames = scoped "navigation"
  { root: "root"
  , title: "title"
  , menu: "menu"
  , menuItem: "menu-item"
  , menuItemActive: "menu-item-active"
  }

stylesheet ∷ Rendered
stylesheet = render do
  className_ classNames.root ? do
    backgroundColor Color.backgroundLight
    display flex
    justifyContent spaceBetween
    borderBottom Border.solid (px 1.0) Color.translucent
  className_ classNames.title ? do
    color Color.foreground
    cursor Cursor.pointer
    fontSize $ rem 2.0
    fontWeight fontWeights.semibold
  className_ classNames.menu ? do
    display flex
    alignItems center
    margin_ nil
  className_ classNames.menuItem ? do
    display flex
    alignItems center
    padding_ $ rem 1.0
    borderRight Border.solid (px 1.0) Color.translucent
    color Color.foregroundLight
    fontSize fontSizes.sm
    textTransform uppercase
    cursor Cursor.pointer
  className_ classNames.menuItemActive ? do
    backgroundColor Base16.base0F
    color Color.foregroundInversed
