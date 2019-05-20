module SoundCloud.Component.Root.Style
  ( ClassNames
  , classNames
  , stylesheet
  ) where

import CSS
import Prelude (pure, unit, discard)

import SoundCloud.CSS (className_)

type ClassNames =
  { root ∷ String
  , content ∷ String
  }

classNames ∷ ClassNames
classNames =
  { root: "app"
  , content: "app-content"
  }

stylesheet ∷ Rendered
stylesheet = render do
  className_ classNames.root ? do
    pure unit
  className_ classNames.content ? do
    pure unit
