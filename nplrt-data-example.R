#!/usr/local/bin/Rscript
set.seed(206)
job.id <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))

source("nplrt-vimp-rev.R")
require(speff2trial)
data(ACTG175)
dat.actg <- subset(ACTG175, cd40 > 0)

Y <- log10(dat.actg$cd420)
X <- with(dat.actg, 
          cbind(age, wtkg, gender, hemo, treat, log10(cd40))) 
continuous <- c(TRUE, TRUE, FALSE, FALSE, FALSE, TRUE)

vimp.out <- Vimp(y = Y, x = X[,job.id], W = X[,-job.id], continuous = continuous[job.id],
                 no.bs = 50000)

fname <- paste0("actg_vimp", job.id,".rda")
save(vimp.out, file = fname)
