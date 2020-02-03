module MainTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag)
import Tuple exposing (first)

import Main exposing (..)

updateTest =
    describe "test of update function" 
    [ test "increment message gives an incremented state" 
        (\_ -> Expect.equal 1 (update Increment 0 |> first))
    , test "decrement message gives an decremented state" 
        (\_ -> Expect.equal 0 (update Decrement 1 |> first))
    ]

viewTest : Test
viewTest = 
    test "view should render counter" <| 
        \_ -> view 5 
            |> Query.fromHtml
            |> Query.find [ tag "div" ]
            |> Query.has [ text "5" ]