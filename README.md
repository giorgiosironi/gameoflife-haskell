== Example ==

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
