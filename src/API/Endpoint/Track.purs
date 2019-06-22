module SoundCloud.API.Endpoint.Track
  ( TrackArgs
  , Genre
  , TrackParams
  , TrackQuery
  , trackArgs
  ) where

import Prelude hiding ((/))

import Data.Maybe (Maybe)
import Routing.Duplex (RouteDuplex', many1, optional, param, record, (:=))
import SoundCloud.API.Data (Pagination, Public)
import SoundCloud.API.Routing (paginated, public)
import Type.Prelude (SProxy(..))
import Type.Row (type (+))

-- example:
-- https://api.soundcloud.com/tracks?
-- linked_partitioning=1
-- &limit=20
-- &offset=0
-- &tags=techno
-- &client_id=6e66f316dfe62dd5b5fdb0e4f0eb4eb3

type Genre = String
type TrackParams r = (genres ∷ Maybe (Array Genre) | r)
type TrackQuery = { | TrackParams + () }
type TrackArgs = { | Public + TrackParams + Pagination + () }

trackArgs ∷ RouteDuplex' TrackArgs
trackArgs = record
  # tags := optional (many1 $ param "tags")
  # public
  # paginated
  where
    tags = SProxy ∷ _ "genres"
