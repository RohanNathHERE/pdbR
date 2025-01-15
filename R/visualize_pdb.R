#' Visualize PDB Structure in 3D
#'
#' Displays a 3D interactive plot of the PDB structure.
#' @param pdb_path Path to the PDB file.
#' @export
visualize_pdb <- function(pdb_path) {

  # Ensure file exists
  if (!file.exists(pdb_path)) {
    stop("The specified PDB file does not exist.")
  }

  # Read PDB file using bio3d
  pdb <- bio3d::read.pdb(pdb_path)

  # 2D visualization using base plot
  plot(pdb, type = "l", col = "blue", main = "2D PDB Structure Plot")

  # Interactive 3D visualization using r3dmol (optional)
  if (requireNamespace("r3dmol", quietly = TRUE)) {
    r3dmol::r3dmol() %>%
      r3dmol::add_model(pdb_path) %>%
      r3dmol::set_style(style = r3dmol::style_cartoon(color = "spectrum")) %>%
      r3dmol::zoom_to()
  } else {
    message("For interactive 3D visualization, please install the 'r3dmol' package.")
  }
}
