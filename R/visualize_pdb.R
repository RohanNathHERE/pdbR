#' Visualize PDB Structure in 3D
#'
#' Displays a 3D interactive plot of the PDB structure.
#' @param pdb_path Path to the PDF file.
#' @export

visualize_pdb <- function(pdb_path) {
  library(bio3d)

  # Read PDB file
  pdb <- read.pdb(pdb_path)

  # 3D visualization using bio3d
  plot(pdb, type = "1", col = "blue", main = "3D PDB Structure")
}
