module SoundCloud.Data.Track
  ( TrackId
  , Track
  , Track'
  , decoder
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

type TrackId = Int

type Track' =
  { id ∷ TrackId
  , playback_count ∷ Int
  , favoritings_count ∷ Int
  , comment_count ∷ Int
  , permalink_url ∷ String
  , artwork_url ∷ String
  }

type Track =
  { id ∷ TrackId
  , playbacks ∷ Int
  , favoritings ∷ Int
  , comments ∷ Int
  , permalinkUrl ∷ String
  , artworkUrl ∷ String
  }

decoder ∷ Track' → Track
decoder t =
  { id: t.id
  , playbacks: t.playback_count
  , favoritings: t.favoritings_count
  , comments: t.comment_count
  , permalinkUrl: t.permalink_url
  , artworkUrl: t.artwork_url
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
