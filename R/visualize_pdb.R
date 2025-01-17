#' Visualize PDB Structure in 3D
#'
#' Displays a 3D interactive plot of the PDB structure. Also generates a simple
#' 2D plot of alpha-carbon coordinates for a quick "backbone trace" view.
#' @param pdb_path Path to the PDB file.
#' @export
visualize_pdb <- function(pdb_path) {

  # Ensure file exists
  if (!file.exists(pdb_path)) {
    stop("The specified PDB file does not exist.")
  }

  # Read PDB file using bio3d
  pdb <- bio3d::read.pdb(pdb_path)

  # 2D visualization of alpha-carbon trace
  # First, select alpha-carbons
  ca_inds <- bio3d::atom.select(pdb, "calpha")

  # Extract x, y, z coords of alpha-carbons into a matrix
  ca_xyz <- matrix(pdb$xyz[ca_inds$xyz], ncol = 3, byrow = TRUE)

  # Plot the alpha-carbon "backbone" in the XY plane
  plot(
    ca_xyz[, 1],
    ca_xyz[, 2],
    type = "l",
    col = "blue",
    xlab = "X",
    ylab = "Y",
    main = "2D Alpha-Carbon Trace"
  )

  # Optional: Interactive 3D visualization using r3dmol
  if (requireNamespace("r3dmol", quietly = TRUE)) {
    # Display message so user knows an interactive plot is coming
    message("Rendering 3D structure in your viewer/browser...")

    r3dmol::r3dmol() %>%
      r3dmol::add_model(data = pdb_path, format = "pdb") %>%
      r3dmol::set_style(style = r3dmol::style_cartoon(color = "spectrum")) %>%
      r3dmol::zoom_to()
  } else {
    message("For interactive 3D visualization, please install the 'r3dmol' package.")
  }
}
