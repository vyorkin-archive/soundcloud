module SoundCloud.Component.Player
  ( Component
  , HTML
  , Input
  , Action
  , player
  , module SoundCloud.Component.Player.Style
  ) where

import Prelude

import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Monoid (guard)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Prelude.Unicode ((∘), (≡))
import SoundCloud.Component.HTML.Playlist (playlist)
import SoundCloud.Component.Player.Style (classNames, stylesheet)
import SoundCloud.Data.Track (Track, TrackId, TrackMap)
import SoundCloud.HTML.Util (css)

data Action
  = Play TrackId
  | Stop
  | Enqueue Track
  | Remove TrackId
  | Clear
  | ToggleShuffle
  | ToggleRepeat
  | SetVolume Int

type Input = Unit

type State =
  { volume ∷ Int
  , shuffle ∷ Boolean
  , repeat ∷ Boolean
  , visible ∷ Boolean
  , activeTrackId ∷ Maybe TrackId
  , playing ∷ Boolean
  , playlist ∷ TrackMap
  }

type Component m = ∀ q. H.Component HH.HTML q Input Void m
type HTML m = H.ComponentHTML Action () m
type ActionHandler m = Action → H.HalogenM State Action () Void m Unit

player ∷ ∀ m. Component m
player = H.mkComponent
  { initialState
  , render
  , eval: H.mkEval $ H.defaultEval
    { handleAction = handleAction
    }
  }
  where
  initialState ∷ Input → State
  initialState _ =
    { volume: 70
    , shuffle: false
    , repeat: false
    , visible: false
    , activeTrackId: Nothing
    , playing: false
    , playlist: Map.empty
    }

  handleAction ∷ ActionHandler m
  handleAction = case _ of
    Play id → do
      H.modify_ _ { playing = true, activeTrackId = Just id }
    Stop → do
      H.modify_ _ { playing = false, activeTrackId = Nothing }
    Enqueue track → do
      H.modify_ \s → s { playlist = Map.insert track.id track s.playlist }
    Remove id → do
      H.modify_ \s → s { playlist = Map.delete id s.playlist }
    Clear → do
      handleAction Stop
      H.modify_ _ { playlist = Map.empty ∷ TrackMap }
    ToggleShuffle → do
      H.modify_ \s → s { shuffle = not s.shuffle }
    ToggleRepeat → do
      H.modify_ \s → s { repeat = not s.repeat }
    SetVolume v → do
      H.modify_ _ { volume = v }

  render ∷ State → HTML m
  render _ =
    HH.div
    [ css [classNames.root] ]
    [ HH.text "player" ]
