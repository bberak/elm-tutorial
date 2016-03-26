module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- MODEL


type alias Model = Int


-- UPDATE

type Action = Inc | Dec

update : Action -> Model -> Model
update action model =
  case action of
    Inc -> model + 1
    Dec -> model - 1


-- VIEW


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Dec ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Inc ] [ text "+" ]
    ]



countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
