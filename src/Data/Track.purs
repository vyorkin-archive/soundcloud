module SoundCloud.Data.Track
  ( TrackMap
  , TrackId
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
import Data.Map (Map)
import SoundCloud.API.Endpoint.Track (Genre)
import Type.Prelude (SProxy(..))

type TrackId = Int
type TrackMap = Map TrackId Track

type Track' =
  { id ∷ TrackId
  , user_id ∷ Int
  , title ∷ String
  , duration ∷ Int
  , kind ∷ String
  , genre :: Genre
  , playback_count ∷ Int
  , favoritings_count ∷ Int
  , likes_count ∷ Int
  , reposts_count ∷ Int
  , comment_count ∷ Int
  , commentable ∷ Boolean
  , permalink_url ∷ String
  , artwork_url ∷ String
  , waveform_url ∷ String
  , created_at ∷ String
  , last_modified ∷ String
  }

type Track =
  { id ∷ TrackId
  , userId ∷ Int
  , title ∷ String
  , duration ∷ Int
  , kind ∷ String
  , genre :: Genre
  , playbacks ∷ Int
  , favoritings ∷ Int
  , likes ∷ Int
  , reposts ∷ Int
  , comments ∷ Int
  , commentable ∷ Boolean
  , permalinkUrl ∷ String
  , artworkUrl ∷ String
  , waveformUrl ∷ String
  , createdAt ∷ String
  , lastModified ∷ String
  }

decoder ∷ Track' → Track
decoder t =
  { id: t.id
  , userId: t.user_id
  , title: t.title
  , duration: t.duration
  , kind: t.kind
  , genre: t.genre
  , playbacks: t.playback_count
  , favoritings: t.favoritings_count
  , likes: t.likes_count
  , reposts: t.reposts_count
  , commentable: t.commentable
  , comments: t.comment_count
  , permalinkUrl: t.permalink_url
  , artworkUrl: t.artwork_url
  , waveformUrl: t.waveform_url
  , createdAt: t.created_at
  , lastModified: t.last_modified
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
