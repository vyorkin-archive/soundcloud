module SoundCloud.API.Request
  ( mkRequest
  , module SoundCloud.API.Request.Auth
  ) where

import Prelude

import Affjax (Request)
import Affjax.RequestBody as RequestBody
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (Json)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import SoundCloud.API.Endpoint (Endpoint)
import SoundCloud.API.Endpoint as Endpoint
import SoundCloud.API.Request.Auth (Token)
import SoundCloud.API.Request.BaseURL (BaseURL(..))
import SoundCloud.API.Request.Verb (Verb)
import SoundCloud.API.Request.Verb as Verb

mkRequest ∷ BaseURL → Verb → Endpoint → Request Json
mkRequest (BaseURL baseUrl) verb endpoint =
  { method: Left (Verb.method verb)
  , url: baseUrl <> Endpoint.print endpoint
  , headers: []
  , content: RequestBody.json <$> Verb.body verb
  , username: Nothing
  , password: Nothing
  , withCredentials: false
  , responseFormat: ResponseFormat.json
  }
