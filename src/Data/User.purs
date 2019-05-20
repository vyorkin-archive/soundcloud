module SoundCloud.Data.User
  ( User
  , _id
  , _name
  , _followings
  , _followers
  , _tracks
  , _avatarUrl
  , _permalinkUrl
  ) where

import Data.Lens (Lens')
import Data.Lens.Record (prop)
import Type.Prelude (SProxy(..))

-- followings_count
-- followers_count
-- track_count
-- avatar_url
-- username
-- permalink_url

type User =
  { id ∷ Int
  , name ∷ String
  , followings ∷ Int
  , followers ∷ Int
  , tracks ∷ Int
  , avatarUrl ∷ String
  , permalinkUrl ∷ String
  }

-- Lenses

_id ∷ Lens' User Int
_id = prop (SProxy ∷ SProxy "id")

_name ∷ Lens' User String
_name = prop (SProxy ∷ SProxy "name")

_followings ∷ Lens' User Int
_followings = prop (SProxy ∷ SProxy "followings")

_followers ∷ Lens' User Int
_followers = prop (SProxy ∷ SProxy "followers")

_tracks ∷ Lens' User Int
_tracks = prop (SProxy ∷ SProxy "tracks")

_avatarUrl ∷ Lens' User String
_avatarUrl = prop (SProxy ∷ SProxy "avatarUrl")

_permalinkUrl ∷ Lens' User String
_permalinkUrl = prop (SProxy ∷ SProxy "permalinkUrl")
