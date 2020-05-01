# SugaLint

Source code analysis tool in Haskell.

## Usage

```
sugalint -lc ... Line count the entire repository, and get the 
                 1. maximum number of chars in each line
                 2. minimum number of chars in each line
                 3. average number of chars in each line
```


```
sugalint --groovy ... this does parse/analyze the entire groovy directory and find out
                      the wrong part and warn it. i create this because groovy compiler never
                      warns the [unused import] and [unused variables/functions/function args]
```
