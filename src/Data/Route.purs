module SoundCloud.Data.Route
  ( Route(..)
  , codec
  , parse
  , print
  , toTitle
  ) where

import Prelude hiding ((/))

import Data.Either (Either)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Routing.Duplex (RouteDuplex', root)
import Routing.Duplex.Generic (noArgs, sum)
import Routing.Duplex.Generic.Syntax ((/))
import Routing.Duplex.Parser (RouteError)
import Routing.Duplex (parse, print) as Route

data Route
  = Home
  | About

derive instance genericRoute ∷ Generic Route _
derive instance eqRoute ∷ Eq Route
derive instance ordRoute ∷ Ord Route

instance showRoute ∷ Show Route where
  show = genericShow

codec ∷ RouteDuplex' Route
codec = root $ sum
  { "Home": noArgs
  , "About": "about" / noArgs
  }

parse ∷ String → Either RouteError Route
parse = Route.parse codec

print ∷ Route → String
print = Route.print codec

toTitle ∷ Route → String
toTitle = case _ of
  Home → "Home"
  About → "About"
