module SoundCloud.Capability.Resource.Track
  ( class TrackGateway
  , getTracks
  ) where

import Control.Monad.Reader (class MonadAsk)
import Control.Monad.Trans.Class (lift)
import Data.Maybe (Maybe)
import Halogen (HalogenM)
import Prelude.Unicode ((∘))
import SoundCloud.API.Endpoint.Track (TrackQuery)
import SoundCloud.Data.Track (Track)
import SoundCloud.Env (Env)

class TrackGateway m where
  getTracks ∷ (MonadAsk Env m) ⇒ TrackQuery → Int → m (Maybe (Array Track))

instance trackGatewayHalogenM
  ∷ (TrackGateway m, MonadAsk Env m)
  ⇒ TrackGateway (HalogenM state action slots output m) where
  getTracks query = lift ∘ getTracks query
