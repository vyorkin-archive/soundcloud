module SoundCloud.Component.Navigation.Style
  ( ClassNames
  , classNames
  , stylesheet
  ) where

import CSS

import CSS.Border as Border
import Prelude (pure, unit, discard)
import SoundCloud.CSS (className_, scoped)
import SoundCloud.Style.Color as Color

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
  className_ classNames.menu ? do
    pure unit
  className_ classNames.menuItem ? do
    pure unit
  className_ classNames.menuItemActive ? do
    pure unit
