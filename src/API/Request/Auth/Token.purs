module SoundCloud.API.Request.Auth.Token
  ( Token
  , read
  , write
  , attach
  ) where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect)
import Prelude.Unicode ((∘))
import Prim.Row (class Lacks)
import Record as Record
import Type.Prelude (SProxy(..))
import Web.HTML (window)
import Web.HTML.Window (localStorage)
import Web.Storage.Storage (getItem, setItem)

newtype Token = Token String

derive newtype instance eqToken ∷ Eq Token

instance showToken ∷ Show Token where
  show (Token _) = "Token {- token -}"

key ∷ String
key = "token"

read ∷ Effect (Maybe Token)
read = window >>= localStorage >>= getItem key >>= pure ∘ map Token

write ∷ Token → Effect Unit
write (Token token) = window >>= localStorage >>= setItem key token

attach ∷ ∀ r. Lacks "token" r ⇒ Token → { | r } → { token ∷ String | r }
attach (Token token) = Record.insert (SProxy ∷ _ "token") token
