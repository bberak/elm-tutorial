module Architecture.Composing.Widget (..) where


import Html exposing (Html)
import Html.Events as Events


type alias Model =
  { count : Int
  }


initialModel : Model
initialModel =
  { count = 0
  }


type Action = Increase | Decrease


view : Signal.Address Action -> Model -> Html
view address model =
  Html.div
    []
    [ Html.div [] [ Html.text (toString model.count) ]
    , Html.button
        [ Events.onClick address Increase ]
        [ Html.text "Increase" ]
    , Html.button
        [ Events.onClick address Decrease ]
        [ Html.text "Decrease" ]
    ]


update : Action -> Model -> Model
update action model =
  case action of
    Increase ->
      { model | count = model.count + 1 }

    Decrease ->
      { model | count = model.count - 1 }
