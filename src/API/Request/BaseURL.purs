module SoundCloud.API.Request.BaseURL
  ( BaseURL(..)
  , toString
  ) where

import Affjax (URL)

newtype BaseURL = BaseURL URL

toString ∷ BaseURL → String
toString (BaseURL url) = url
