module Main (..) where


import Html
import Time


clockSignal : Signal Time.Time
clockSignal =
  Time.every Time.second


messageSignal : Signal String
messageSignal =
  Signal.map toString clockSignal


view : String -> Html.Html
view str =
  Html.text str


main : Signal.Signal Html.Html
main =
  Signal.map view messageSignal
