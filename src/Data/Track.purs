module SoundCloud.Data.Track
  ( TrackId
  , Track
  , _id
  , _playbacks
  , _favoritings
  , _comments
  , _permalinkUrl
  , _artworkUrl
  ) where

import Data.Lens (Lens')
import Data.Lens.Record (prop)
import Type.Prelude (SProxy(..))

-- playback_count
-- favoritings_count
-- comment_count
-- permalink_url
-- artwork_url

type TrackId = Int

type Track =
  { id ∷ TrackId
  , playbacks ∷ Int
  , favoritings ∷ Int
  , comments ∷ Int
  , permalinkUrl ∷ String
  , artworkUrl ∷ String
  }

_id ∷ Lens' Track TrackId
_id = prop (SProxy ∷ SProxy "id")

_playbacks ∷ Lens' Track Int
_playbacks = prop (SProxy ∷ SProxy "playbacks")

_favoritings ∷ Lens' Track Int
_favoritings = prop (SProxy ∷ SProxy "favoritings")

_comments ∷ Lens' Track Int
_comments = prop (SProxy ∷ SProxy "comments")

_permalinkUrl ∷ Lens' Track String
_permalinkUrl = prop (SProxy ∷ SProxy "permalinkUrl")

_artworkUrl ∷ Lens' Track String
_artworkUrl = prop (SProxy ∷ SProxy "artworkUrl")
