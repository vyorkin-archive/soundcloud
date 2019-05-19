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
    , "formatters"
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
    , "record-extra"
    , "remotedata"
    , "routing"
    , "routing-duplex"
    , "simple-json"
    , "prettier"
    , "node-fs-aff"
    , "encoding"
    , "spec"
    , "spec-quickcheck"
    , "strings"
    , "tuples"
    , "unicode-prelude"
    , "uri"
    ]
, packages =
    ./packages.dhall
}
