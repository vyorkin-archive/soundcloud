module SoundCloud.Component.HTML.Track
  ( TrackAction
  , TrackActions
  , track
  , module SoundCloud.Component.HTML.Track.Style
  ) where

import Prelude

import Halogen.HTML as HH
import SoundCloud.Component.HTML.Track.Style (classNames, stylesheet)
import SoundCloud.Data.Track (Track, TrackId)
import SoundCloud.HTML.Util (css)

type TrackAction a = TrackId → a

type TrackActions a =
  { play ∷ TrackAction a
  , comment ∷ TrackAction a
  , enqueue ∷ TrackAction a
  }

track
  ∷ ∀ props action
  . TrackActions action
  → Track
  → HH.HTML props action
track actions item =
  HH.div
  [ css [classNames.root]
  ]
  [ HH.text $ show item.title
  ]
