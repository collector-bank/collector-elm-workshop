# A basic web app

In this exercise we will create a very simple web app that lets the user increment or decrement a value.

## Create a new, empty project

Create a new folder and run elm init.

```cmd
> elm init
```

## Add code

Create a new file called **Main.elm** in th **/src** folder. Copy-paste the following code.

```elm
module Main

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
```

## Run the application

Start up elm reactor (which is a simple http server that comes with the elm-lang framework).

```
> elm reactor
```

Surf to http://localhost:8000/ and locate Main.elm and click it to start the application. Try the increment and decrement buttons. 
