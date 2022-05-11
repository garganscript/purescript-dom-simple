{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "dom-simple"
, dependencies =
    [ "aff"
    , "arrays"
    , "effect"
    , "ffi-simple"
    , "maybe"
    , "nullable"
    , "prelude"
    , "unsafe-coerce"
    , "spec"
   ]
, packages = ./packages.dhall
}
