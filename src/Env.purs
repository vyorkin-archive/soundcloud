module SoundCloud.Env
  ( Env
  , mkEnv
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Ref (Ref)
import Effect.Ref as Ref
import Routing.PushState (PushStateInterface)
import Routing.PushState as Routing
import SoundCloud.Data.Config (Config)
import SoundCloud.Data.Config as Config
import SoundCloud.Data.LogLevel (LogLevel)
import SoundCloud.Data.User (User)

type Env =
  { logLevel ∷ LogLevel
  , config ∷ Config
  , location ∷ PushStateInterface
  , currentUser ∷ Ref (Maybe User)
  }

mkEnv ∷ LogLevel → Effect Env
mkEnv logLevel = do
  location ← Routing.makeInterface
  currentUser ← Ref.new Nothing
  let config = Config.default
  pure { logLevel
       , location
       , config
       , currentUser
       }
