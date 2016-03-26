module Mailboxes (..) where

import Html exposing (Html)
import Html.Events as Events

mb : Signal.Mailbox String
mb =
  Signal.mailbox ""

view : Signal.Address String -> String -> Html
view address message =
  Html.div
    []
    [ Html.div [] [ Html.text message ]
    , Html.button
      [ Events.onClick address "Hello" ]
      [ Html.text "Click" ]
    ]

main : Signal Html
main =
  Signal.map (view mb.address) mb.signal
