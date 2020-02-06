# Extend the app with a http request

In this exercise we will add a button that makes a http request to retrieve a random number that will be used as the new counter value.

## Application models

So far we have used the the sandbox application model to construct our main function.

```elm
main =
  Browser.sandbox { init = 0, update = update, view = view }
```

This model is not powerful enough to express programs that makes http requests. For this we need something called **commands** in elm. Programs created using **Browser.element** allows commands.

A simple example of a main function constructed using ```Browser.element``` is given among the elm examples and its can be found [here](https://elm-lang.org/examples/book).

The most important things to note is that
* The **init function** now has the type ```flags -> (model, Cmd msg)``` instead of simply ```model```.
* The **update function** now has the type ```msg -> model -> (model, Cmd msg)``` instead of simply ```msg -> model -> model```. This gives us the opportunity to return both a new application model and a command that the elm framework will execute for us. In this example we will create a http request command.
* There is a new **subscriptions function** (not needed now)

## Guide

1. Add required packages for http and json

```cmd
> elm install elm/http
> elm install elm/json
```

2. Add module import declarations

```elm
import Http
import Json.Decode exposing (int, field)
```

3. Make sure the following **type alias** is defined

```elm
type alias Model = Int
```

4. Replace **Browser.sandbox** with **Browser.element** in the main function.

```elm
main : Program () Model Msg
main =
  Browser.element
      { init = \_ -> (0, Cmd.none)
      , update = update
      , subscriptions = \_ -> Sub.none
      , view = view
      }
```

5. Add two new data constructors for the message type

```elm
type Msg = ... | MkRequest |  GotResponse (Result Http.Error Int)
```

6. Change the type signature of the update function to fit the Browser.element requirements

```elm
update : Msg -> Model -> (Model, Cmd Msg)
```

7. Update return values to match the type signature for existing messages

```elm
update msg model =
  case msg of
    Increment ->
      (model + 1, Cmd.none)

    Decrement ->
      (model - 1, Cmd.none)

    Double ->
      (model * 2, Cmd.none)
```

8. Add handlers for the two new messages in the **update function** 

```elm
update msg model =
  case msg of
    ...
    MkRequest -> 
        (model, mkRequestCommand) -- mkRequestCommand will be defined later
    GotResponse response ->
        case response of
            Ok value -> (value, Cmd.none)
            _ -> (model, Cmd.none)  -- ignore http errors
```

9. Implement **mkRequestCommand**

```elm
mkRequestCommand : Cmd Msg
mkRequestCommand = 
    Http.get
        { url = "https://collector-elm-workhop.glitch.me/api/random"
        , expect = Http.expectJson GotResponse (field "random" int)
        }
```

10. Update the **view function** to render a button that will trigger the request

```elm
view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Double ] [ text "2x" ]
    , button [ onClick MkRequest ] [ text "randomize"]
    ]
```

## Fix the tests

The type signature for update has changed so the tests do not work anymore. Try to fix it. 

## References
* https://package.elm-lang.org/packages/elm/browser/latest/Browser
