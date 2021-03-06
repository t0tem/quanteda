% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spacyr-methods.R
\name{spacyr-methods}
\alias{spacyr-methods}
\title{extensions of methods defined in the quanteda package}
\arguments{
\item{x}{an object returned by \code{spacy_parse}}

\item{...}{unused}
}
\description{
Extensions to quanteda functions.  You must have attached \pkg{quanteda} for these
to work.
}
\section{Usage}{

\code{docnames(x)} returns the document names

\code{ndoc(x)} returns the number of documents

\code{ntoken(x, ...)} returns the number of tokens by document

\code{ntype(x, ...)} returns the number of types (unique tokens) by document
}

\examples{
\dontrun{
require(spacyr)
spacy_initialize()
txt <- c(doc1 = "And now, now, now for something completely different.",
         doc2 = "Jack and Jill are children.")
parsed <- spacy_parse(txt)
ntype(parsed)
ntoken(parsed)
ndoc(parsed)
docnames(parsed)
}
}
