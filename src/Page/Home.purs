module SoundCloud.Page.Home
  ( Component'
  , Component
  , WithCapabilities
  , HTML
  , State
  , Action
  , component
  ) where

import Prelude

import Control.Monad.Reader (class MonadAsk)
import Data.Maybe (Maybe(..))
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.HTML as HH
import Network.RemoteData (RemoteData(..))
import Network.RemoteData as RemoteData
import SoundCloud.API.Endpoint.Track (Genre)
import SoundCloud.Capability.Resource.Track (class TrackGateway, getTracks)
import SoundCloud.Data.Track (Track)
import SoundCloud.Env (Env)

type State =
  { genres ∷ Array Genre
  , tracks ∷ RemoteData String (Array Track)
  , page ∷ Int
  }

data Action
  = Initialize
  | LoadTracks

type Component' m = ∀ q. H.Component HH.HTML q Unit Void m
type Component  m = WithCapabilities Component' m
type HTML m = H.ComponentHTML Action () m
type ActionHandler m = Action → H.HalogenM State Action () Void m Unit

type WithCapabilities c m
  = MonadAff m
  ⇒ MonadAsk Env m
  ⇒ TrackGateway m
  ⇒ c m

component ∷ ∀ m. Component m
component = H.mkComponent
  { initialState
  , render
  , eval: H.mkEval H.defaultEval
    { initialize = Just Initialize
    , handleAction = handleAction
    }
  }
  where
  initialState ∷ Unit → State
  initialState = const
    { genres: ["ambient", "techno"]
    , tracks: NotAsked
    , page: 0
    }

  handleAction ∷ ActionHandler m
  handleAction = case _ of
    Initialize → do
      void $ H.fork $ handleAction LoadTracks
    LoadTracks → do
      { genres, page } ← H.get
      H.modify_ _ { tracks = Loading }
      tracks ← getTracks { genres: Just genres } page
      H.modify_ _ { tracks = RemoteData.fromMaybe tracks }

  render ∷ State → HTML m
  render { tracks } = renderTracks tracks

  renderTracks ∷ ∀ props. RemoteData String (Array Track) → HH.HTML props Action
  renderTracks = case _ of
    NotAsked →
      HH.div_ [ HH.text "Not loaded" ]
    Loading →
      HH.div_ [ HH.text "Loading" ]
    Failure err →
      HH.div_ [ HH.text $ "Loading failed: " <> err ]
    Success tracks →
      HH.div_ $ tracks <#> renderTrack

  renderTrack ∷ ∀ props. Track → HH.HTML props Action
  renderTrack t =
    HH.div_
    [ HH.text $ show t.id
    ]
