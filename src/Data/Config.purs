module SoundCloud.Data.Config
  ( Config
  , ClientId
  , default
  ) where

import SoundCloud.API.Request.BaseURL (BaseURL(..))

type ClientId = String

type Config =
  { baseUrl ∷ BaseURL
  , clientId ∷ ClientId
  , redirectUri ∷ String
  , pageSize ∷ Int
  }

default ∷ Config
default =
  { baseUrl: BaseURL "https://api.soundcloud.com"
  , clientId: "6e66f316dfe62dd5b5fdb0e4f0eb4eb3"
  , redirectUri: "http://localhost:9292/auth/soundcloud/callback"
  , pageSize: 20
  }
