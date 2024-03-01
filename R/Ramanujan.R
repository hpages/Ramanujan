### Finds all the numbers <= 'Nmax' that can be expressed as a sum of two
### positive integer cubes in at least 'k' distinct ways.
###
### Returns a data.frame with columns 'N', 'n1', and 'n2'. 'n1' and 'n2' are
### such that 'n1^3 + n2^3 == N'.
###
### First 3 numbers expressible as the sum of two cubes in 2 distinct ways:
###   > Ramanujan(2e4, k=2)
###         N  n1 n2 
###   1  1729   9 10
###   2  1729   1 12
###   3  4104   9 15
###   4  4104   2 16
###   5 13832  18 20
###   6 13832   2 24
### 1729 is the Hardy-Ramanujan number.
### See https://en.wikipedia.org/wiki/1729_(number)
###
### First 2 numbers expressible as the sum of two cubes in 3 distinct ways:
###   > Ramanujan(1.2e8, k=3)
###             N  n1  n2 
###   1  87539319 255 414
###   2  87539319 228 423
###   3  87539319 167 436
###   4 119824488 346 428
###   5 119824488  90 492
###   6 119824488  11 493
###
### 'Ramanujan(1e13, k=4)' found the 4th taxicab number (6963472309248,
### denoted Ta(4)) in half a minute on a laptop running Ubuntu 16.04.5 LTS
### with 16Gb of RAM. It used about 10Gb of memory.
### Ta(4) is the smallest integer that can be expressed as a sum of two
### positive integer cubes in 4 distinct ways: 13322^3 + 16630^3,
### 10200^3 + 18072^3, 5436^3 + 18948^3, and 2421^3 + 19083^3.
### See https://en.wikipedia.org/wiki/Taxicab_number
Ramanujan <- function(Nmax, k=2)
{
    d <- as.integer(Nmax^(1/3))
    s <- seq_len(d)
    n1 <- sequence(s)
    n2 <- rep.int(s, s)
    ## Using x*x*x is about 10x faster than using x^3.
    ## We coerce to numeric to avoid integer arithmetic overflow.
    N <- as.numeric(n1)*n1*n1 + as.numeric(n2)*n2*n2

    ## We could put 'N', 'n1', and 'n2' together in a data.frame 'df' and
    ## perform the following filtering/reordering on 'df':
    ##   (1) remove rows for which 'N' is > 'Nmax',
    ##   (2) order the remaining rows by 'N',
    ##   (3) keep only rows for which the same 'N' is repeated at least 'k'
    ##       times.
    ## This can be done as follow:
    ##   df <- data.frame(N, n1, n2)
    ##   df <- df[N <= Nmax, ]
    ##   df <- df[order(df$N), ]
    ##   r <- Rle(df$N)
    ##   keep <- rep.int(runLength(r) >= k, runLength(r))
    ##   df[keep, ]
    ## The above code is simple and describes our final goal i.e. **what** we
    ## want to achieve. However it's not efficient (because data.frame
    ## subsetting is expensive) so that's not **how** we're going to do it.
    ## A more efficient way is to filter/reorder 'N', 'n1', and 'n2' separately
    ## and put them together in a data.frame only at the end.

    keep_idx <- which(N <= Nmax)
    N <- N[keep_idx]
    o <- order(N)
    N <- N[o]
    keep_idx2 <- keep_idx[o]
    n1 <- n1[keep_idx2]
    n2 <- n2[keep_idx2]
    r <- S4Vectors::Rle(N)

    keep <- rep.int(S4Vectors::runLength(r) >= k, S4Vectors::runLength(r))
    N <- N[keep]
    n1 <- n1[keep]
    n2 <- n2[keep]

    data.frame(N, n1, n2)
}

