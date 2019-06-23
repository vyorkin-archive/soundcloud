module SoundCloud.Component.HTML
  ( stylesheet
  , module SoundCloud.Component.HTML.TrackList
  , module SoundCloud.Component.HTML.Track
  , module SoundCloud.Component.HTML.Playlist
  ) where

import CSS (Rendered)
import Prelude ((<>))
import SoundCloud.Component.HTML.Track (track)
import SoundCloud.Component.HTML.Track as Track
import SoundCloud.Component.HTML.TrackList (trackList)
import SoundCloud.Component.HTML.TrackList as TrackList
import SoundCloud.Component.HTML.Playlist (playlist)
import SoundCloud.Component.HTML.Playlist as Playlist

stylesheet ∷ Rendered
stylesheet
    = TrackList.stylesheet
   <> Track.stylesheet
   <> Playlist.stylesheet
