module SoundCloud.API.Request.Verb
  ( Verb(..)
  , body
  , method
  ) where

import Data.Argonaut.Core (Json)
import Data.HTTP.Method (Method)
import Data.HTTP.Method as Http
import Data.Maybe (Maybe(..))

data Verb
  = Get
  | Post (Maybe Json)
  | Put (Maybe Json)
  | Delete

body ∷ Verb → Maybe Json
body = case _ of
  Get       → Nothing
  Post json → json
  Put json  → json
  Delete    → Nothing

method ∷ Verb → Method
method = case _ of
  Get    → Http.GET
  Post _ → Http.POST
  Put _  → Http.PUT
  Delete → Http.DELETE
