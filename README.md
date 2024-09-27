**Ramanujan** is an R package for finding numbers expressible as the sum of two cubes in different ways.

```
library(Ramanujan)

## Find numbers <= 2e4 expressible as the sum of two cubes
## in 2 distinct ways:
Ramanujan(Nmax=2e4, k=2)

## Find numbers <= 2e8 expressible as the sum of two cubes
## in 3 distinct ways:
Ramanujan(Nmax=2e8, k=3)

## Ramanujan(1e13, k=4) will find the 4th taxicab number
## (6963472309248, denoted Ta(4)) in < 30s on a machine
## with enough RAM (it uses about 12.5Gb of memory):
Ramanujan(1e13, k=4)
```

Links:

- [Some interesting facts](https://en.wikipedia.org/wiki/1729_(number)) about number 1729.

- [More about taxicab numbers](https://en.wikipedia.org/wiki/Taxicab_number).

- [A must see movie](https://www.imdb.com/title/tt0787524/?ref_=ext_shr_lnk).

