module SoundCloud.API.Routing
  ( public
  , authenticated
  , paginated
  ) where

import Prelude

import Prim.Row (class Lacks)
import Routing.Duplex (RouteDuplex, int, optional, param, string, (:=))
import SoundCloud.API.Data (Auth, Pagination, Public)
import Type.Prelude (SProxy(..))

-- Additional commonly used combinators

public
  ∷ ∀ r r'
  . Lacks "clientId" r
  ⇒ RouteDuplex { | Public r' } { | r }
  → RouteDuplex { | Public r' } { | Public r }
public = clientId := string (param "client_id")
  where
    clientId = SProxy ∷ _ "clientId"

authenticated
  ∷ ∀ r r'
  . Lacks "token" r
  ⇒ RouteDuplex { | Auth r' } { | r }
  → RouteDuplex { | Auth r' } { | Auth r }
authenticated = token := string (param "oauth_token")
  where
    token = SProxy ∷ _ "token"

paginated
  ∷ ∀ r r'
  . Lacks "offset" r
  ⇒ Lacks "limit" r
  ⇒ RouteDuplex { | Pagination r' } { | r }
  → RouteDuplex { | Pagination r' } { | Pagination r }
paginated x = x
  # offset := optional (int $ param "offset")
  # limit  := optional (int $ param "limit")
  where
    offset = SProxy ∷ _ "offset"
    limit  = SProxy ∷ _ "limit"
