{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purak"
, dependencies =
  [ "console", "effect", "enums", "lists", "maybe", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
