{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
, name =
    "soundcloud"
, dependencies =
    [ "aff"
    , "affjax"
    , "console"
    , "css"
    , "datetime"
    , "effect"
    , "either"
    , "exists"
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
    , "ordered-collections"
    , "profunctor-lenses"
    , "psci-support"
    , "quickcheck"
    , "record"
    , "record-extra"
    , "remotedata"
    , "routing"
    , "routing-duplex"
    , "simple-json"
    , "soundcloud"
    , "prettier"
    , "node-fs"
    , "node-fs-aff"
    , "node-path"
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
