module Main (..) where


import Html
import Time
import Http
import Task


view : String -> Html.Html
view str =
  Html.text str


clockSignal : Signal Time.Time
clockSignal =
  Time.every (2 * Time.second)


mb : Signal.Mailbox String
mb =
  Signal.mailbox ""


httpTask : Task.Task Http.Error String
httpTask =
  Http.getString "http://finance.google.com/finance/info?q=AAPL"


sendToMb : String -> Task.Task x ()
sendToMb result =
  Signal.send mb.address result


runTask : Task.Task Http.Error ()
runTask =
  Task.andThen httpTask sendToMb


taskSignal : Signal (Task.Task Http.Error ())
taskSignal =
  Signal.map (always runTask) clockSignal


main : Signal.Signal Html.Html
main =
  Signal.map view mb.signal


port runner : Signal (Task.Task Http.Error ())
port runner =
  taskSignal
