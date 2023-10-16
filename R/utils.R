#' @title Calculate the UTM zone of the centroid for a given sf object
#' @name utm_zone_calc
#' @details Based on the code at http://bit.ly/17SdcuN
#'
#' @param x An \code{sf} object
#' 
#' @returns An object of class \code{crs}
#' 
#' @export
#' 
utm_zone_calc <- function(x) {
  
  # turn off s2 (see https://github.com/r-spatial/sf/issues/1771)
  sf_use_s2(FALSE)
  
  # is x an sf object?
  if(!is(x, 'sf')) stop('x has to be an sf object')
  
  # need a check here for polygon, multipolygon
  
  # more than 1 polygon?
  if(NROW(x) > 1) {
    warning('more than 1 polygon detected, combining...')
    x <- sf::st_union(x) 
  }
  
  # transform to lat/long
  x <- sf::st_transform(x, sf::st_crs('+init=epsg:4236'))
  
  # grab centroid
  centroid <- sf::st_coordinates(sf::st_centroid(x))
  x <- centroid[1, 'X']
  y <- centroid[1, 'Y']
  
  # some quick error checks
  if (x < -180 || x > 180) {
    stop('longitude must be between -180 and 180')
  }
  if (y < -90 || y > 90) {
    stop('latitude must be between -90 and 90')
  }
  
  # figure out UTM zone
  zone_num <- floor((x + 180) / 6) + 1
  if (y >= 56.0 && y < 64.0 && x >= 3.0 && x < 12.0) {
    zone_num <- 32
  }
  
  # special zone_nums for Svalbard
  if (y >= 72.0 && y < 84.0) {
    if (x >= 0.0 && x < 9.0) {
      zone_num <- 31
    } else if (x >= 9.0 && x < 21.0) {
      zone_num <- 33
    } else if (x >= 21.0 && x < 33.0) {
      zone_num <- 35
    } else if (x >= 33.0 && x < 42.0) {
      zone_num <- 37
    }
  }
  
  if (y >= 0) {
    ns <- 'N'
  } else {
    ns <- 'S'
  }
  
  # proj4string
  if (ns == 'N') {
    proj4string <- paste0('+init=epsg:326', sprintf('%02i', zone_num))
  } else {
    proj4string <- paste0('+init=epsg:327', sprintf('%02i', zone_num))
  }
  
  # output
  return(sf::st_crs(proj4string))
  
}

#' @titlet Calculate the statistics necessary for drawing a box plot with \code{ggplot2}
#' @name boxplot_stat
#'
#' @param x A \code{numeric} vector
#' 
#' @returns A vector of length 5 that contains the lower whisker (10th percentile), 
#' the lower hinge (25th percentile), the median, the upper hinge (75th percentile), 
#' and the upper whisker (90th percentile)
#' 
#' @export
#' 
boxplot_stat = function(x) {
  coef <- 1.5
  n <- sum(!is.na(x))
  stats <- quantile(x, probs = c(0.1, 0.25, 0.5, 0.75, 0.9))
  names(stats) <- c('ymin', 'lower', 'middle', 'upper', 'ymax')
  return(stats)
}
