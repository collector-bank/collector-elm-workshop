# Explore Elm

The purpose of this chapter is to give some inspiration on how to explore Elm on your own. Remember, these are just for inspiration. Experiment, play around, break free and have fun! Remember that the [elm-lang documentation](https://guide.elm-lang.org/) is a good source of knowledge and that the [elm-lang examples](https://elm-lang.org/examples) are good as well.

## Turn the application into a calculator   

* Add basic calculator functionality; add, subtract, multiply and divide
  * What is the application state of a calculator?
* Add css styling
  * Try out [typed css](https://github.com/rtfeldman/elm-css) or...
  * Try out [elm-bootstrap](https://package.elm-lang.org/packages/rundis/elm-bootstrap/1.0.0/)

## Fuzzy testing (property based testing)

The elm test framework supports [fuzzy testing](https://elmprogramming.com/fuzz-testing.html) in which the random values will be generated and fed into your tests.

* Write one or more fuzzy tests
* Write your own ```Fuzzer``` instance to control how the random values are generated

## Json parsing

We only scratched the surface of json parsing. Writing decoders gives insight into a pattern the often comes up in elm (and functional programming). Go for a deep dive.

* Combine simple parsers into more complex ones. Refer to the [json-decode package documentation](https://package.elm-lang.org/packages/elm/json/latest/Json-Decode) for more information. You can try it out in a a unit test for quick iterations.
* Try out the [elm-json-decode-pipeline package](https://github.com/NoRedInk/elm-json-decode-pipeline)
* Learn how to model complex data structures with tuples, records and discriminant unions. Refer to [elm-lang custom types](https://guide.elm-lang.org/types/custom_types.html).

## Switch to application model Browser.application

```Browser.application``` is a more general model than ```Browser.sandbox``` and ```Browser.element``` and it gives the opportunity to react on brower url navigation. Refer to [elm-lang navigation](https://guide.elm-lang.org/webapps/navigation.html) for more information.

* Try extending the app with two tabbed pages