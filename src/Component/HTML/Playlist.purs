module SoundCloud.Component.HTML.Playlist
  ( PlaylistActions
  , playlist
  , module SoundCloud.Component.HTML.Playlist.Style
  ) where

import Prelude

import Halogen.HTML (div)
import Halogen.HTML as HH
import SoundCloud.Component.HTML.Track (TrackAction)
import SoundCloud.Component.HTML.Playlist.Style (classNames, stylesheet)
import SoundCloud.Data.Track (Track)
import SoundCloud.HTML.Util (css)

type PlaylistActions a =
  { play ∷ TrackAction a
  , remove ∷ TrackAction a
  , clear ∷ a
  }

playlist
  ∷ ∀ props action
  . PlaylistActions action
  → Array Track
  → HH.HTML props action
playlist { play, remove, clear } items =
  div
  [ css [classNames.root] ]
  [ div
    [ css [classNames.header] ]
    [
    ]
  ]

-- item
--   ∷
