let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.0-20220509/packages.dhall sha256:d4c1a03606efdbb7bb7745a9d3aa908cb1ba5611921373659a4c7bf1c41c106c
      
let overrides = {=}

let additions =
      { ffi-simple =
        { dependencies = 
          [ "aff"
          , "arrays"
          , "effect"
          , "foldable-traversable"
          , "functions"
          , "maybe"
          , "nullable"
          , "prelude"
          , "refs"
          , "spec"
          , "tuples"
          , "unsafe-coerce"
          , "unsafe-reference" ]
        , repo = "https://github.com/garganscript/purescript-ffi-simple"
        , version = "v0.3.1"
        }
      , spec-mocha =
        { dependencies = [ "console", "foldable-traversable", "exceptions", "spec" ]
        , repo = "https://github.com/purescript-spec/purescript-spec-mocha"
        , version = "v4.0.0"
        }
      }
      

in  upstream // overrides // additions
