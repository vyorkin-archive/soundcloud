module SoundCloud.API
  ( ajax
  , module SoundCloud.API.Request
  , module SoundCloud.API.Request.Verb
  , module SoundCloud.API.Response
  , module SoundCloud.API.Endpoint
  , module SoundCloud.API.Util
  ) where

import Prelude

import Affjax as Affjax
import Control.Monad.Reader (class MonadAsk, asks)
import Effect.Aff.Class (class MonadAff, liftAff)
import Simple.JSON (class ReadForeign)
import SoundCloud.API.Util (decode, decodeWith)
import SoundCloud.API.Endpoint (AuthArgs, BrowseArgs, Endpoint(..), print)
import SoundCloud.API.Request (mkRequest)
import SoundCloud.API.Request.Verb (Verb(..))
import SoundCloud.API.Response (Response, toResponse, Error(..))
import SoundCloud.Env (Env)

ajax
  ∷ ∀ a m
  . MonadAff m
  ⇒ MonadAsk Env m
  ⇒ ReadForeign a
  ⇒ Verb
  → Endpoint
  → m (Response a)
ajax verb endpoint = do
  { baseUrl } ← asks _.config
  let req = mkRequest baseUrl verb endpoint
  res ← liftAff $ Affjax.request req
  pure $ toResponse res.body
