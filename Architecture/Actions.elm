module Architecture.Actions (..) where


import Html exposing (Html)
import Mouse


type alias Model =
  { count : Int
  }


type Action = Nothing | Increase


initialModel : Model
initialModel =
  { count = 0
  }


view : Model -> Html
view model =
  Html.text (toString model.count)


update : Action -> Model -> Model
update action model =
  case action of
    Increase ->
      { model | count = model.count + 1 }

    Nothing ->
      model


actionSignal : Signal.Signal Action
actionSignal =
  Signal.map (\_ -> Increase) Mouse.clicks


modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel actionSignal


main : Signal.Signal Html
main =
  Signal.map view modelSignal
