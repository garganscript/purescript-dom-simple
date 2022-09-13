let upstream =
      https://github.com/garganscript/package-sets/releases/download/v0.1.1/release.dhall
        sha256:3c81462c6823cdd57dd2d8e845a90192b9b2c8d177d13d7abb3666e667e3eedf

let overrides = {=}

let additions = {=}

in  upstream // overrides // additions
