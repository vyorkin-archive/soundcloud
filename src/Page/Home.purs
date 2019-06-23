module SoundCloud.Page.Home
  ( Component'
  , Component
  , WithCapabilities
  , HTML
  , State
  , Action
  , component
  , module SoundCloud.Page.Home.Style
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
import SoundCloud.Component.HTML (trackList)
import SoundCloud.Component.HTML.Track (TrackActions)
import SoundCloud.Data.Track (Track, TrackId)
import SoundCloud.Env (Env)
import SoundCloud.HTML.Util (css)
import SoundCloud.Page.Home.Style (classNames, stylesheet)

type State =
  { genres ∷ Array Genre
  , tracks ∷ RemoteData String (Array Track)
  , page ∷ Int
  }

data Action
  = Initialize
  | LoadTracks
  | Play TrackId
  | Comment TrackId
  | Enqueue TrackId

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
    Play id → do
      pure unit
    Comment id → do
      pure unit
    Enqueue id → do
      pure unit

  trackActions ∷ TrackActions Action
  trackActions =
    { play: Play
    , comment: Comment
    , enqueue: Enqueue
    }

  render ∷ State → HTML m
  render { tracks } =
    HH.div
    [ css [classNames.root]
    ]
    [ trackList trackActions tracks ]
