Haskell implementation of [Conway's Game Of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life), showing a 10x10 window over the evolving infinite plane.

## Example of usage

```
*Main> mapM_ print (visualize_generation bar)
"          "
"XXX       "
"          "
"          "
"          "
"          "
"          "
"          "
"          "
"          "
*Main> mapM_ print (visualize_generation (evolution bar))
" X        "
" X        "
" X        "
"          "
"          "
"          "
"          "
"          "
"          "
"          "
*Main> mapM_ print (visualize_generation (evolution (evolution bar)))
"          "
"XXX       "
"          "
"          "
"          "
"          "
"          "
"          "
"          "
"          "
```
