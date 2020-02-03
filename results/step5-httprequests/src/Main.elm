module Main exposing(..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (int, field)

type alias Model = Int

main : Program () Model Msg
main =
  Browser.element
      { init = \_ -> (0, Cmd.none)
      , update = update
      , subscriptions = \_ -> Sub.none
      , view = view
      }

type Msg = Increment | Decrement | Double | MkRequest |  GotResponse (Result Http.Error Int)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      (model + 1, Cmd.none)

    Decrement ->
      (model - 1, Cmd.none)

    Double ->
      (model * 2, Cmd.none)

    MkRequest -> 
        (model, mkRequestCommand)

    GotResponse response ->
        case response of
            Ok value -> (value, Cmd.none)
            _ -> (model, Cmd.none)  -- ignore http errors

mkRequestCommand : Cmd Msg
mkRequestCommand = 
    Http.get
        {  url = "https://func-elmworkshop-dev.azurewebsites.net/api/HttpTrigger1?code="
        , expect = Http.expectJson GotResponse (field "random" int)
        }

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Double ] [ text "2x" ]
    , button [ onClick MkRequest ] [ text "randomize"]
    ]