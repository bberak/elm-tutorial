module Signals.Intro (..) where

import Html exposing (Html)
import Mouse


view : (Int, Int) -> Html
view (x, y) =
  Html.text (toString x ++ ", " ++ toString y)


main : Signal.Signal Html
main =
  Signal.map view Mouse.position
