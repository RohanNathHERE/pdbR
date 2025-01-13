#' Fetch PDB Structure from RCSB PDB
#'
#' Downloads PDB files from the RCSB database.
#' @param pdb_id A string specifying the PDB ID (e.g., "1a2b").
#' @return File path to the downloaded PDB file.
#' @export

fetch_pdb <- function(pdb_id) {
  url <- paste0("https://files.rcsb.org/download/", pdb_id, ".pdb")
  file_path <- paste0(tempdir(), "/", pdb_id, ".pdb")

  httr::GET(url, httr::write_disk(file_path, overwrite = TRUE))
  if (file.exists(file.path)) {
    message("PDB file downloaded: ", file_path)
  } else {
    stop("Failed to download PDB file. Check PDB ID.")
  }

  return(file_path)
}
