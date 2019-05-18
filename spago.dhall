{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "soundcloud"
, dependencies =
    [ "aff"
    , "affjax"
    , "console"
    , "css"
    , "datetime"
    , "effect"
    , "either"
    , "foreign"
    , "foreign-generic"
    , "foreign-object"
    , "generics-rep-optics"
    , "halogen"
    , "halogen-css"
    , "logging"
    , "nonempty"
    , "now"
    , "prelude"
    , "profunctor-lenses"
    , "psci-support"
    , "quickcheck"
    , "record"
    , "remotedata"
    , "routing"
    , "routing-duplex"
    , "simple-json"
    , "spec"
    , "spec-quickcheck"
    , "tuples"
    , "unicode-prelude"
    , "uri"
    ]
, packages =
    ./packages.dhall
}
