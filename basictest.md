# Adding tests

## Setup
The get the project setup for tests simply run

```cmd
> elm-test init
```

## Add a test file
A file **Example.elm** is created in the **/tests** folder. 

Rename it to **MainTests.elm** and replace the existing code with the following.

```elm
module MainTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Main exposing (..)

updateWithIncrement : Test
updateWithIncrement = 
    test "increment message gives an incremented state" 
        (\_ -> Expect.equal 1 (update Increment 0))

```

## Run the tests

Execute the following command to run the tests

```cmd
> elm-test
```

## Add a test for decrement

Try to add a test for Decrement.

## Group related tests

The **describe** function can group multiple tests for better code structure as exemplified below.

```elm
groupOfTests = 
    describe = "related tests"
    [ ...test 1...
    , ...test 2...
    ]
```

Group the tests of the update function using **describe**.

## Test the view method

The test framework provides utility functions for testing functions that generate html.

Example

```elm
import Html
import Html.Attributes exposing (class)
import Test exposing (test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag)

test "Button has the expected text" <|
    \() ->
        Html.div [ class "container" ]
            [ Html.button [] [ Html.text "I'm a button!" ] ]
            |> Query.fromHtml
            |> Query.find [ tag "button" ]
            |> Query.has [ text "I'm a button!" ]
```
More examples can be found [here](https://github.com/elm-explorations/test/blob/master/tests/src/Test/Html/QueryTests.elm).

Try to write a test for the view function.

