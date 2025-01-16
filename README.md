# pdbR Package

The **pdbR** package provides tools for working with PDB (Protein Data Bank) files in R, allowing for easy retrieval and visualization of protein structures. This package supports both basic 2D plotting and interactive 3D visualization of PDB structures.

## Installation

You can install the latest version of `pdbR` from GitHub using the `devtools` package.

``` r
# Install devtools if not already installed
install.packages("devtools")

# Install pdbR from Github
devtools::install_github("RohanNathHERE/pdbR")
```

Alternatively, you can build the package from source after downloading the .tar.gz file.

## Function

`fetch_pdb(pdb_id)`

Fetches a PDB structure from the RCSB PDB database by its ID.

**Argument:**

-   `pdb_id`: A string specifying the PDB ID (e.g., "1a2b").

**Returns:**

-   Path to the downloaded PDB file.

**Example:**

``` r
pdb_file <- fetch_pdb("1a2b")
```

`visualize_pdb(pdb_path`

Visualizes a PDB structure both in 2D and interactive 3D.

**Argument:**

-   `pdb_path`: Path to the PDB file.

**Returns:**

-   A 2D plot of the PDB structure and an interactive 3D visualization (if the `r3dmol`) package is installed.

**Example:**

``` r
visualize_pdb("path/to/1a2b.pdb")
```

## Dependencies

-   `bio3d` - For reading and basic plotting of PDB files.

-   `r3dmol` (optional) - For interactive 3D visualization.

You can install the necessary dependencies using:

``` r
install.packages("bio3d")
```

For 3D visualization, install `r3dmol`:

``` r
devtools::install_github("ramnathv/r3dmol")
```

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

1.  Fork the repository.

2.  Create a new branch (`git checkout -b feature-branch`).

3.  Commit your changes (`git commit -am 'Add new feature'`).

4.  Push to the branch (`git push origin feature-branch`).

5.  Open a pull request.

## Author

-   [Rohan Nath](https://github.com/RohanNathHERE)
