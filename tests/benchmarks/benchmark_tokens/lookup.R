load("/home/kohei/Documents/Brexit/Analysis/data_tokens_guardian.RData")
toks <- tokens(data_tokens_guardian)

dict <- dictionary(list(country = "united states", 
                        law=c('law*', 'constitution'), 
                        freedom=c('free*', 'libert*')))
dict_fix <- dictionary(list(country = "united states", 
                            law=c('law', 'constitution'), 
                            freedom=c('freedom', 'liberty'))) 

microbenchmark::microbenchmark(
    cpp1=tokens_lookup(toks, dict_fix, valuetype='fixed', verbose=FALSE),
    cpp2=tokens_lookup(toks, dict_fix, valuetype='fixed', verbose=FALSE, nomatch = 'NA'),
    times=1
)

dict_liwc <- dictionary(file='/home/kohei/Documents/Dictionary/LIWC/LIWC2007_English.dic')

microbenchmark::microbenchmark(
    fixed=tokens_lookup(toks, dict_liwc, valuetype='fixed', verbose=FALSE),
    glob=tokens_lookup(toks, dict_liwc, valuetype='glob', verbose=FALSE),
    times=1
)

microbenchmark::microbenchmark(
    dfm=applyDictionary(dfm(toks), dict_liwc, valuetype='glob', verbose=FALSE),
    tokens=tokens_lookup(toks, dict_liwc, valuetype='glob', verbose=FALSE),
    times=1
)

toks_short <- tokens(tokenize(inaugCorpus, what='sentence', simplify=TRUE))
microbenchmark::microbenchmark(
    r=applyDictionary(toks_short, dict, valuetype='fixed', verbose=FALSE),
    cpp=tokens_lookup(toks_short, dict, valuetype='fixed', verbose=FALSE),
    times=1
)


txt <- readLines('~/Documents/Brexit/Analysis/all_bbc_2015.txt') # 80MB
txt <- readLines('~/Documents/LSS/Data/Ukracine crisis/ua_3agency.txt') # 660MB
toks <- tokens(txt)

microbenchmark::microbenchmark(
    glob=tokens_lookup(toks, dict_liwc, valuetype='glob', verbose=TRUE),
    fixed=tokens_lookup(toks, dict_liwc, valuetype='fixed', verbose=TRUE),
    times=1
)


system.time(tokens_lookup(toks, dict_liwc, valuetype='glob', verbose=TRUE))

profvis::profvis(tokens_lookup(toks, dict_liwc, valuetype='glob', verbose=FALSE))



