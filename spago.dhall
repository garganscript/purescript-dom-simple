{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "dom-simple"
, dependencies =
    [ "arrays"
    , "console"
    , "effect"
    , "functions"
    , "nullable"
    , "prelude"
    , "spec"
    , "spec-mocha"
    , "unsafe-coerce"
    , "ffi-simple"
    ]
, packages = ./packages.dhall
}
