# Type signatures

Elm is a statically typed language. If a type signature is missing elm will try to deduce it. The recommendation is to provide type signatures for root level functions since it helps understanding the program and to get better error messages.

Here are some example of root level functions with type signatures.

```elm
add : Int -> Int -> Int
add x y = x + y

repeat : String -> Int -> String
repeat s n = 
    if n < 1 then 
        ""
    else
        s ++ repeat s (n - 1)
```

Start the **repl** and enter the definitions above and test calling the functions as well.

```cmd
> elm repl
```

Try to add type signatures to the root level functions in the application. 

**Hint** add any type signature and look at the compiler error.