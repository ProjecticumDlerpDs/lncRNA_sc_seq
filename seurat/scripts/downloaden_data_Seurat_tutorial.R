
# URL van de 10x PBMC3K data
url <- "https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz"
dataset <- here("raw_data", "pbmc3k_filtered_gene_bc_matrices.tar.gz")

# Download het bestand alleen als het nog niet bestaat
if(!file.exists(dataset)){
  download.file(url, dataset)
}

# Pak uit in raw_data map
untar(dataset, exdir = here("raw_data"))

# Controleer folderstructuur (optioneel)
list.files(here("raw_data"), recursive = TRUE)