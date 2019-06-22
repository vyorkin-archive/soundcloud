module SoundCloud.API.Request.Auth
  ( login
  , module SoundCloud.API.Request.Auth.Token
  ) where

import Prelude

import Data.Options ((:=))
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import SoundCloud (redirectUri)
import SoundCloud as SC
import SoundCloud.API.Request.Auth.Token (Token)
import SoundCloud.Data.Config (Config)

login ∷ Config → Aff SC.Session
login cfg = do
  liftEffect $ SC.initialize cfg.clientId $
    redirectUri := cfg.redirectUri
  SC.connect
