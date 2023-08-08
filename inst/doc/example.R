## ----oscar--------------------------------------------------------------------
library(oscar)

## ----echo=FALSE---------------------------------------------------------------
# The computationally heavy parts have been precomputed but are reproducible with the presented code
load("example_workspace.RData")

## ----exdata-------------------------------------------------------------------
data(ex)
ex_X[1:7,1:7]
head(ex_Y)

## ----kits---------------------------------------------------------------------
ex_K[1:7,1:7]
apply(ex_K, MARGIN=1, FUN=sum) # Row indicator sums
apply(ex_K, MARGIN=2, FUN=sum) # Column indicator sums

## ----cvec---------------------------------------------------------------------
head(ex_c)

## ----coxfit, eval = FALSE-----------------------------------------------------
#  set.seed(1)
#  fit <- oscar(x=ex_X, y=ex_Y, k=ex_K, w=ex_c, family="cox", solver="LMBM")
#  fit

## ----pareto, eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Pareto front for the clinical measurements, their total cost and C-index."----
#  oscar.pareto.visu(fit=fit)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Pareto front for the clinical measurements, their total cost and C-index."----
knitr::include_graphics("images/fig1_pareto.png")

## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Target function value as a function of k."----
#  oscar.visu(fit, y=c("target", "cost"))

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Target function value as a function of k."----
knitr::include_graphics("images/fig2_targetfunc_cost.png")

## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="5-fold cross-validation for optimally generalizable cardinality 'k'"----
#  # Perform 5-fold cross-validation to find out optimal k
#  cv <- oscar.cv(fit, fold=5, seed=123)
#  # Visualize model generalization performance as a function of k
#  oscar.cv.visu(cv)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="5-fold cross-validation for optimally generalizable cardinality 'k'"----
knitr::include_graphics("images/fig3_cv.png")

## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Selected variables over a set of bootstrap runs"----
#  # Bootstrap original data 20 times (sampling with replacement and refitting)
#  bs <- oscar.bs(fit, bootstrap=20, seed=234)
#  # Visualize bootstrapped models
#  oscar.bs.plot(fit=fit, bs=bs, nbins=20)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Selected variables over a set of bootstrap runs"----
knitr::include_graphics("images/fig4_bs.png")

## ----eval=TRUE----------------------------------------------------------------

coef(fit, k=3) # All potential coefficients at cardinality k=3
feat(fit, k=3) # All features chosen at cardinality k=3
cost(fit, k=3) # Kit sum costs at various k cardinalities, here with cardinality k=3


## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Model coefficients as a function of cardinality 'k'."----
#  # Use example swiss-data for quickness
#  data(swiss)
#  fit_swiss <- oscar(x=swiss[,-1], y=swiss[,1], family="mse", print=0, solver=2)
#  
#  # Plot model coefficients as a function of cardinality k
#  plot(fit_swiss)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Model coefficients as a function of cardinality 'k'."----
knitr::include_graphics("images/fig5_swiss_coef.png")

## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Bootstrapping of Swiss fertility data (Gaussian/MSE)"----
#  # Bootstrap original data 50 times (sampling with replacement and refitting)
#  bs_swiss <- oscar.bs(fit_swiss, bootstrap=50, seed=1, solver=2)
#  # Visualize trajectories of bootstrapped coefficients
#  oscar.bs.plot(fit=fit_swiss, bs=bs_swiss, nbins=50)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="Bootstrapping of Swiss fertility data (Gaussian/MSE)"----
knitr::include_graphics("images/fig6_swiss_bs.png")

## ----eval=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="10-fold cross-validation for optimally generalizable cardinality 'k'"----
#  # Perform 5-fold cross-validation to find out optimal k
#  cv_swiss <- oscar.cv(fit_swiss, fold=10, seed=2)
#  # Visualize model generalization performance as a function of k
#  oscar.cv.visu(cv_swiss)

## ----echo=FALSE, dpi=150, fig.width=7, fig.height=7, out.width="100%", fig.cap="10-fold cross-validation for optimally generalizable cardinality 'k'"----
knitr::include_graphics("images/fig7_swiss_cv.png")

## ----sesinfo------------------------------------------------------------------
sessionInfo()

