#' Sample points
#'
#' @param x Virtual point cloud, LAScatalog, LAS, or path to files
#' @param filter Character. Filters passed to lasR::reader_las
#'
#' @return Dataframe containing XYZ coordinates of sampled points
#' @export
#'
#' @examples
#' f <- system.file("extdata", "Topography.las", package = "lasR")
#' df <- sample_points(f)
#' head(df)
sample_points <- function(x, filter = "-keep_class 2 -keep_random_fraction 0.01") {
  read <- lasR::reader_las(
    filter = filter
  )
  call <- lasR::callback(
    \(d) return(d),
    expose = "xyz",
    no_las_update = TRUE
  )
  return(lasR::exec(read + call, on = x))
}
