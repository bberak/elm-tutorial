module Architecture.MultipleActions (..) where


import Html exposing (Html)
import Mouse
import Keyboard


type alias Model =
  { count : Int
  }


type Action = Nothing | Increase | Decrease


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

    Decrease ->
      { model | count = model.count - 1 }

    Nothing ->
      model


mouseSignal : Signal.Signal Action
mouseSignal =
  Signal.map (\_ -> Increase) Mouse.clicks


keyboardSignal : Signal.Signal Action
keyboardSignal =
  Signal.map (\_ -> Decrease) Keyboard.presses


actionSignal : Signal.Signal Action
actionSignal =
  Signal.merge mouseSignal keyboardSignal


modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel actionSignal


main : Signal.Signal Html
main =
  Signal.map view modelSignal
