
# URL die verwijst naar de 10x PBMC3K data voor de seurat tutoral. Hier wordt een object van gemaakt.  
url <- "https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz"
# Hier wordt de here functie ingeladen.
library(here)
# de here functie verwijst naar het begin van het project. 
here()
# Er wordt een object aangemaakt dat het pad naar het gedownloade bestand bevat. Met de here() functie wordt verwezen naar de map raw_data, waarin het tar.gz-bestand wordt opgeslagen.
dataset <- here("raw_data", "pbmc3k_filtered_gene_bc_matrices.tar.gz")

# Download het bestand alleen als het nog niet bestaat.
if(!file.exists(dataset)){
  download.file(url, dataset)
}

# Pak het gezipte bestand uit in de ruwe data map zodat het direct gebruikt kan worden.
untar(dataset, exdir = here("raw_data"))

