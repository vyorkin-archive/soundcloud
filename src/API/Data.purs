module SoundCloud.API.Data
  ( Public
  , Auth
  , Pagination
  , identify
  , paginate
  ) where

import Prelude
import Data.Maybe (Maybe(..))
import Prelude.Unicode ((∘))
import Prim.Row (class Lacks)
import Record as Record
import SoundCloud.Data.Config (ClientId)
import Type.Prelude (SProxy(..))

type Public r = (clientId ∷ String | r)
type Auth r = (token ∷ String | r)

type Pagination r =
  ( limit  ∷ Maybe Int
  , offset ∷ Maybe Int
  | r
  )

identify
  ∷ ∀ r
  . Lacks "clientId" r
  ⇒ ClientId
  → { | r }
  → { | Public r }
identify cid =
  Record.insert (SProxy ∷ _ "clientId") cid

paginate
  ∷ ∀ r
  . Lacks "limit" r
  ⇒ Lacks "offset" r
  ⇒ Int
  → Int
  → { | r }
  → { | Pagination r }
paginate page count =
  let
    limit  = Just count
    offset = Just $ (page + 1) * count
  in
    Record.insert (SProxy ∷ _ "limit") limit
  ∘ Record.insert (SProxy ∷ _ "offset") offset
