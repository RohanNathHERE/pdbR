#' Perform Statistical Tests and Generate Plot for PDB Files
#'
#' This function reads a PDB file, extracts atomic coordinates, performs basic
#' statistical tests (mean, variance, etc.), and generates an aesthetic plot of
#' atomic positions.
#'
#' @param pdb_path Path to the PDB file.
#' @export
#' @import bio3d ggplot2 dplyr

analyze_pdb <- function(pdb_path) {
  # Load necessary libraries
  if (!requireNamespace("bio3d", quietly = TRUE)) {
    stop("Package 'bio3d' is required but not installed. Please install it.")
  }
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required but not installed. Please install it.")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package 'dplyr' is required but not installed. Please install it.")
  }

  library(bio3d)
  library(ggplot2)
  library(dplyr)

  # Read PDB file
  pdb <- read.pdb(pdb_path)

  # Extract atomic coordinates
  atoms <- pdb$atom

  # Filter for protein atoms only (e.g., CA atoms of amino acids)
  protein_atoms <- atoms %>% filter(elety == "CA")

  # Perform statistical tests
  stats <- data.frame(
    coordinate = c("x", "y", "z"),
    mean = c(mean(protein_atoms$x), mean(protein_atoms$y), mean(protein_atoms$z)),
    variance = c(var(protein_atoms$x), var(protein_atoms$y), var(protein_atoms$z)),
    median = c(median(protein_atoms$x), median(protein_atoms$y), median(protein_atoms$z))
  )

  print("Statistical Summary of Atomic Coordinates:")
  print(stats)

  # Generate aesthetic plot of atomic positions
  p <- ggplot(protein_atoms, aes(x = x, y = y, color = z)) +
    geom_point(size = 3, alpha = 0.8) +
    scale_color_gradient(low = "blue", high = "red") +
    labs(title = "PDB Structure Visualization",
         x = "X Coordinate",
         y = "Y Coordinate",
         color = "Z Coordinate") +
    theme_minimal()

  print(p)

  return(stats)
}
