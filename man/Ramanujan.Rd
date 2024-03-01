\name{Ramanujan}

\alias{Ramanujan}

\title{1729 and beyond}

\description{
  Finds all the numbers <= \code{Nmax} that can be expressed as a sum of two
  positive integer cubes in at least \code{k} distinct ways.
}

\usage{
Ramanujan(Nmax, k=2)
}

\arguments{
  \item{Nmax}{
    Limit the search to numbers <= \code{Nmax}.
  }
  \item{k}{
    Number of distinct ways the returned numbers can be expressed as a sum
    of two positive integer cubes.
  }
}

\value{
  A data frame with columns \code{N}, \code{n1}, and \code{n2}.
  Columns \code{n1} and \code{n2} show the decomposition of \code{N} as
  the sum of two positive integer cubes i.e. they are such that
  \code{n1^3 + n2^3 == N}.
}

\references{
  \url{https://en.wikipedia.org/wiki/1729_(number)}

  \url{https://en.wikipedia.org/wiki/Taxicab_number}
}

\author{Hervé Pagès}

\examples{
## Find numbers <= 2e4 expressible as the sum of two cubes
## in 2 distinct ways:
Ramanujan(Nmax=2e4, k=2)

## Find numbers <= 2e8 expressible as the sum of two cubes
## in 3 distinct ways:
Ramanujan(Nmax=2e8, k=3)

## Ramanujan(1e13, k=4) will find the 4th taxicab number
## (6963472309248, denoted Ta(4)) in < 30s on a machine
## with enough RAM (it uses about 12.5Gb of memory):
\dontrun{
Ramanujan(1e13, k=4)
}
}

\keyword{manip}
