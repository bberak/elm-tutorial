module Architecture.Mailbox (..) where


import Html exposing (Html)
import Html.Events as Events


type alias Model =
  { count : Int
  }


type Action = Nothing | IncreaseOrDecrease Int


initialModel : Model
initialModel =
  { count = 0
  }


mb : Signal.Mailbox Action
mb =
  Signal.mailbox Nothing


view : Signal.Address Action -> Model -> Html
view address model =
  Html.div
    []
    [ Html.div [] [ Html.text (toString model.count) ]
    , Html.button
        [ Events.onClick address (IncreaseOrDecrease 1) ]
        [ Html.text "Increase" ]
    , Html.button
        [ Events.onClick address (IncreaseOrDecrease -1) ]
        [ Html.text "Decrease" ]
    ]


update : Action -> Model -> Model
update action model =
  case action of
    IncreaseOrDecrease amount ->
      { model | count = model.count + amount }

    Nothing ->
      model


modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel mb.signal


main : Signal.Signal Html
main =
  Signal.map (view mb.address) modelSignal
