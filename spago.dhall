{ sources = [ "src/**/*.purs" ]
, name = "dom-simple"
, dependencies =
    [ "effect"
    , "ffi-simple"
    , "maybe"
    , "nullable"
    , "prelude"
    , "unsafe-coerce"
   ]
, packages = ./packages.dhall
}
