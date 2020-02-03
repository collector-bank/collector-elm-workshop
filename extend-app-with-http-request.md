# Extend the app with a http request

In this exercise we will add a button that makes a http request to retrieve a random number that will be used as the new counter value.

## Application models

So far we have used the the sandbox application model to construct our main function.

```elm
main =
  Browser.sandbox { init = 0, update = update, view = view }
```

This model is not powerful enough to express programs that makes http requests. For this we need something called commands in elm. Programs created using **Browser.element** allows commands (and subscriptions which we will not need for now).

A simple example of a main function constructed using ```Browser.element``` is given among the elm examples and its can be found [here](https://elm-lang.org/examples/book).

The most important things to note is that
* The update function now has the type ```Msg -> Model -> (Model, Cmd Msg)``` instead of simply ```Msg -> Model -> Model```. This gives us the option to return both a new application model and a command that the elm framework will execute for us. In this example we will create a http request command.
* 