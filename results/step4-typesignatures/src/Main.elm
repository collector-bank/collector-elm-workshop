module Main exposing(..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

type alias Model = Int

main : Program () Model Msg
main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement | Double

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Double ->
      model * 2

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Double ] [ text "2x" ]
    ]