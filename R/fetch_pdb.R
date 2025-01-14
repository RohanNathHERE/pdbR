#' Fetch PDB Structure from RCSB PDB
#'
#' Downloads PDB files from the RCSB database.
#' @param pdb_id A string specifying the PDB ID (e.g., "1a2b").
#' @return File path to the downloaded PDB file.
#' @export

fetch_pdb <- function(pdb_id) {
  if (!is.character(pdb_id) || nchar(pdb_id) != 4) {
    stop("Please provide a valid 4-character PDB ID.")
  }

  url <- paste0("https://files.rcsb.org/download/", pdb_id, ".pdb")
  file_path <- file.path(tempdir(), paste0(pdb_id, ".pdb"))

  response <- httr::GET(url, httr::write_disk(file_path, overwrite = TRUE))

  if (httr::status_code(response) == 200 && file.exists(file_path)) {
    message("PDB file downloaded: ", file_path)
  } else {
    stop("Failed to download PDB file. Check PDB ID.")
  }

  return(file_path)
}
