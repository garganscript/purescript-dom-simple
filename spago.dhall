{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "dom-simple"
, dependencies =
    [ "arrays"
    , "effect"
    , "ffi-simple"
    , "foldable-traversable"
    , "maybe"
    , "nullable"
    , "prelude"
    , "spec"
    , "spec-mocha"
    , "unsafe-coerce"
    ]
, packages = ./packages.dhall
}
