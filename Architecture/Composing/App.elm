module Architecture.Composing.App (..) where


import Html exposing (Html)
import StartApp.Simple
import Architecture.Composing.Widget as Widget


type alias AppModel =
  { widgetModel : Widget.Model
  }


initialModel : AppModel
initialModel =
  { widgetModel = Widget.initialModel
  }


type Action
  = WidgetAction Widget.Action


view : Signal.Address Action -> AppModel -> Html
view address model =
  Html.div
    []
    [ Html.text "Main App"
    , Widget.view (Signal.forwardTo address WidgetAction) model.widgetModel
    ]


update : Action -> AppModel -> AppModel
update action model =
  case action of
    WidgetAction subAction ->
      { model | widgetModel = Widget.update subAction model.widgetModel }


main : Signal.Signal Html
main =
  StartApp.Simple.start
    { model = initialModel
    , view = view
    , update = update
    }
