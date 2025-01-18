#' Fetch PDB Structure from RCSB PDB
#'
#' Downloads PDB files from the RCSB database into the current working directory.
#'
#' @param pdb_id A string specifying the PDB ID (e.g., "1a2b").
#' @return File path to the downloaded PDB file.
#' @examples
#' \dontrun{
#' fetch_pdb("1a2b")
#' }
#' @export
fetch_pdb <- function(pdb_id) {
  if (!is.character(pdb_id) || nchar(pdb_id) != 4) {
    stop("Please provide a valid 4-character PDB ID.")
  }

  # Construct the download URL
  url <- paste0("https://files.rcsb.org/download/", pdb_id, ".pdb")

  # Define the file path in the current working directory
  file_path <- file.path(getwd(), paste0(pdb_id, ".pdb"))

  # Perform the HTTP request and write the file
  response <- httr::GET(url, httr::write_disk(file_path, overwrite = TRUE))

  # Check for successful download
  if (httr::status_code(response) == 200 && file.exists(file_path)) {
    message("PDB file downloaded: ", file_path)
  } else {
    stop("Failed to download PDB file. Check PDB ID or your network connection.")
  }

  return(file_path)
}
