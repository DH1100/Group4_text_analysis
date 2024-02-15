## RStudio allows you to run each line as you work with Run above.
## See results in bottom right.

## First install language processing packages. Go to tools, Install Packages, then type CoreNLP.

## Install the Packages
install.packages("syuzhet")
install.packages("RColorBrewer")
install.packages("wordcloud")
install.packages("tm")

## These packages also had to be installed in addition to what is in the script
install.packages("readr")
install.packages("qdap")
install.packages("syuzhet")
install.packages("ggplot2")
install.packages("dplyr")


## Packages are groups of functions that you can use.
## We are putting the following packages into the Library to use.
library("readr")
library("qdap")
library("syuzhet")
library("ggplot2")
library("dplyr")

## make VERY sure that the following packages have loaded-- base, datasets, dplyr, ggplot2, graphics, grDevices, methods, plyr, qdap, qdapDictionaries, qdapRegex, qdapTools, RColorBrewer, RCurl, RDSTK, readr, rjson, stats, syuzhet, twitteR, utils

alexander_hamilton = read_file("/cloud/project/Alexander-Hamilton.txt")
View(alexander_hamilton)

## POLARITY AND SENTIMENT
## in general (for us), sentiment is how postive, negative, or neutral a statement is.
## polarity is the degree of that sentiment
g_scores = get_nrc_sentiment(alexander_hamilton)
class(g_scores)
g_scores
g_polarity = g_scores[1,9:10]
g_sentiment = g_scores[1,1:8]

## visualize polarity
class(g_polarity)
g_polarity = data.matrix(g_polarity, rownames.force = TRUE)
barplot(g_polarity)

## visualize sentiment
class(g_sentiment)
g_sentiment = data.matrix(g_sentiment, rownames.force = TRUE)
barplot(g_sentiment)

## break it down by sentence
g_speech_sen = get_sentences(alexander_hamilton)
g_speech_sen

sentiment_vector = get_sentiment(g_speech_sen, method = "syuzhet")
## A vector is a basic data structure in R.
## It is a sequence of elements that share the same data type. 
## (logical, integer, double, character, complex, or raw data)

sentiment_vector
summary(sentiment_vector)
boxplot(sentiment_vector)

## what was the most positive sentence in the paragraph?
max(sentiment_vector)
sentence_sentiment = data.frame(g_speech_sen, sentiment_vector)
View(sentence_sentiment)
which.max(sentence_sentiment$sentiment_vector)

## we now have an index - what can we do with this?
most_positive = sentence_sentiment[which.max(sentence_sentiment$sentiment_vector),]
## don't forget the comma!

install.packages("devtools")
install.packages("SnowballC")

## Wordclouds
## look over to the right and see that these packages are checked
## if one is absent then go to the console below and type install.packages("MISSINGPACKAGE")
library("devtools")
library("RColorBrewer")
library("tm")
library("SnowballC")
library("wordcloud")

wordcloud(alexander_hamilton,colors=c("blue","green"))

