# deckgl 0.1.3

* Added a `NEWS.md` file to track changes to the package.
* Added support for tooltips:

```r
# Tooltip example for a grid layer

properties <- list(
  pickable = TRUE
  getTooltip = JS("object => `${object.position.join(', ')}\nCount: ${object.count}`")
  fixedTooltip = TRUE # show tooltip always on upper left corner,
  ...
)
```
