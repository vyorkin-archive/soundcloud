module SoundCloud.Component.HTML.TrackList
  ( trackList
  , module SoundCloud.Component.HTML.TrackList.Style
  ) where

import Prelude

import Halogen.HTML (div_, text)
import Halogen.HTML as HH
import Network.RemoteData (RemoteData(..))
import SoundCloud.Component.HTML.Track (TrackActions, track)
import SoundCloud.Component.HTML.TrackList.Style (classNames, stylesheet)
import SoundCloud.Data.Track (Track)
import SoundCloud.HTML.Util (css)

trackList
 ∷ ∀ props action
 . TrackActions action
 → RemoteData String (Array Track)
 → HH.HTML props action
trackList actions items =
  HH.div
  [ css [classNames.root] ]
  [ tracks ]
  where
    tracks = case items of
      NotAsked →
        text "Not loaded"
      Loading →
        text "Loading"
      Failure err →
        text $ "Loading failed: " <> err
      Success ts →
        div_ (ts <#> track actions)
