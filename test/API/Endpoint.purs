module SoundCloud.Test.API.Endpoint (spec) where

import Prelude

import Data.Maybe (Maybe(..))
import SoundCloud.API.Endpoint (Endpoint(..))
import SoundCloud.API.Endpoint as Endpoint
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec ∷ Spec Unit
spec = describe "Endpoint" do
  describe "Tracks" do
    it "constructs valid url" do
      let
        genres = Just ["ambient", "techno"]
        limit = Just 10
        offset = Just 20
        endpoint = Tracks { genres, limit, offset, clientId: "123" }
        url = "/tracks?limit=10&offset=20&client_id=123&tags=techno&tags=ambient"
      Endpoint.print endpoint `shouldEqual` url
