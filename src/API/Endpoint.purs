module SoundCloud.API.Endpoint
  ( Endpoint(..)
  , AuthArgs
  , BrowseArgs
  , print
  ) where

import Prelude hiding ((/))

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Routing.Duplex (RouteDuplex', int, record, root, segment)
import Routing.Duplex (print) as Route
import Routing.Duplex.Generic (noArgs, sum)
import Routing.Duplex.Generic.Syntax ((/))
import SoundCloud.API.Data (Auth, Pagination)
import SoundCloud.API.Endpoint.Track (TrackArgs, trackArgs)
import SoundCloud.API.Routing (authenticated, paginated)
import SoundCloud.Data.User (UserId)
import Type.Row (type (+))

type AuthArgs = { | Auth + () }
type BrowseArgs = { | Auth + Pagination + () }

data Endpoint
  = Login
  | Profile AuthArgs
  | Activities UserId BrowseArgs
  | Favorites UserId BrowseArgs
  | Followings UserId BrowseArgs
  | Followers UserId BrowseArgs
  | Tracks TrackArgs

derive instance genericEndpoint ∷ Generic Endpoint _
instance showEndpoint ∷ Show Endpoint where
  show = genericShow

codec ∷ RouteDuplex' Endpoint
codec = root $ sum
  { "Login":      "login" / noArgs
  , "Profile":    "me" / authArgs
  , "Activities": "users" / int segment / "activities" / privateArgs
  , "Favorites":  "users" / int segment / "favorites"  / privateArgs
  , "Followings": "users" / int segment / "followings" / privateArgs
  , "Followers":  "users" / int segment / "followers"  / privateArgs
  , "Tracks":     "tracks" / trackArgs
  }
  where
    authArgs ∷ RouteDuplex' AuthArgs
    authArgs = record # authenticated

    privateArgs ∷ RouteDuplex' BrowseArgs
    privateArgs = record # authenticated # paginated

print ∷ Endpoint → String
print = Route.print codec
