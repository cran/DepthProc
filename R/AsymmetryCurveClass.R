#' @rdname getPlot-methods
#' @export
setMethod("getPlot", "AsymmetryCurveList", function(object) {
  p <- .getPlot(object)
  p <- p + ggtitle("Asymmetry Curve")
  p <- p + ylab("")
  p <- p + xlab("Alpha")
  return(p)
})
