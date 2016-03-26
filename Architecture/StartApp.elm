module Architecture.StartApp (..) where


import Html exposing (Html)
import Html.Events as Events
import StartApp.Simple


type alias Model =
  { count : Int
  }


type Action = Nothing | IncreaseOrDecrease Int


initialModel : Model
initialModel =
  { count = 0
  }


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



main : Signal.Signal Html
main =
  StartApp.Simple.start
  { model = initialModel
  , view = view
  , update = update
  }
