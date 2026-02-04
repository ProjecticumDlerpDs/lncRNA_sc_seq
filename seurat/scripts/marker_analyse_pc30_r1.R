
#laad de volgende pakketen in. 
library(dplyr)
library(Seurat)
library(patchwork)
library(data.table)
library(here)
library(writexl)
library(readxl) 

# waar de output opgeslagen moet worden
here()
data_out <- here("seurat",  "bewerkte_data", "marker_analyse_pc30_r1V2")
# wanneer de map van de output nog niet bestaat kan wordt dit aangemaakt
if (!dir.exists(data_out)) {
  dir.create(data_out, recursive = TRUE)
}

# eerst wordt er een pad gemaakt waar de data opgeslagen is op de server.
datadir <- "/home/data/projecticum/splicing/data/"

# object maken van de verschillende type bestanden.
expression_matrix <- ReadMtx(
  feature.column = 1,
  skip.cell = 1,
  skip.feature = 1,
  feature.sep = ",",
  cell.sep = ",",
  mtx = file.path(datadir, "e85_count_matrix.mtx.gz"),
  features = file.path(datadir, "e85_feature_metadata.csv.gz"),
  cells = file.path(datadir, "e85_sample_metadata.csv"), 
)
e85_seuratobject <- CreateSeuratObject(counts = expression_matrix,
                                       project = "mouse_embryo",
                                       min.cells = 3,
                                       min.features = 200)
# feature data wordt ingeladen
feature_meta <- read.csv(
  file.path(datadir, "e85_feature_metadata.csv.gz"),
  header = TRUE
)

# kolommen gelijk maken
rownames(feature_meta) <- feature_meta$feature

# de features toevoegen aan het seurat object
e85_seuratobject[["RNA"]] <- AddMetaData(
  object = e85_seuratobject[["RNA"]],
  metadata = feature_meta
)

# Er wordt een extra colom gemaakt om te kijken naar het percentage mitochondriaal RNA (mRNA). 
e85_seuratobject[["percent.mt"]] <- PercentageFeatureSet(e85_seuratobject, pattern = "^mt-")

# aantal features wat wordt meegenomen is tussen de 200 en 7500. Dit is bepaald aan de hand van de vioolplot. Hierin is te zien dat de meeste waardes hiertussen vallen, maar wel uitfilterd slechte waardes zijn. De maximale aantal features wat wordt meegenomen is best hoog. Hiervoor is gekozen omdat de cellen uit de embryogenese komen. Dit zijn actief delende cellen die veel features produceren. Alle cellen met een mitochondriale waarde boven de 5% worden er ook uit gefilterd. 
e85_seuratobject <- subset(e85_seuratobject, subset = nFeature_RNA > 200 & nFeature_RNA < 7500 & percent.mt < 5 ) 

# de data wordt genormaliseerd met de Log methode. 
e85_seuratobject <- NormalizeData(e85_seuratobject)
e85_seuratobject <- FindVariableFeatures(e85_seuratobject, selection.method = "vst", nfeatures = 2000)

all.genes <- rownames(e85_seuratobject)
e85_seuratobject <- ScaleData(e85_seuratobject, features = all.genes)

# bij de eerste stap maakt Seurat een lijst voor de meest positieve en negatieve genen ten opzichte van de rest van de dataset. 
e85_seuratobject <- RunPCA(e85_seuratobject, features = VariableFeatures(object = e85_seuratobject))

# de findneighbors functie berekend de ruimte tussen de verschillende cellen aan de hand van de PCA waardes. in dit geval worden de eerste 30 PC's mee genomen die zijn bij "dimentie bepalen van de dataset" bepaald.
e85_seuratobject_30 <- FindNeighbors(e85_seuratobject, dims = 1:30)

# de functie Findclusters wordt gebruikt voor het vinden van de clusters. Bij een dataset van ongeveer 3000 cellen wordt de parameter rond de 0,4-1,2 gezet. Bij meer cellen wordt de waarde meer. 
e85_seuratobject_30_R1 <- FindClusters(e85_seuratobject_30, resolution = 1)

# hierna kunnen de clusters weergeven worden in een Umap. Hier worden weer de eerste 30 PCA's gebruikt.
e85_seuratobject_30_R1 <- RunUMAP(e85_seuratobject_30_R1, dims = 1:30)

# Het filteren op alle markers die zijn in de clusters. 
all.markers_30_R1 <- FindAllMarkers(object = e85_seuratobject_30_R1, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)

# output bestand maken
write_xlsx(all.markers_30_R1, file.path(data_out, "markers_30_R1.xlsx"))

# Het filteren op de top 10 markers per PC. 
top10_30_R1 <- all.markers_30_R1 %>%
  filter(p_val_adj < 0.05) %>%
  group_by(cluster) %>%
  slice_max(order_by = avg_log2FC, n = 10)

# exproteren van de top 10 markers.
write_xlsx(top10_30_R1, file.path(data_out, "top10_30_R1.xlsx"))

# Het filteren van welke genen dubbel zijn in de clusters.
dubbele_genen_30_R1 <- top10_30_R1 %>%
  group_by(gene) %>%
  summarize(
    n_clusters = n_distinct(cluster),
    clusters = paste(sort(unique(cluster)), collapse = ", ")
  ) %>%
  filter(n_clusters > 1) %>%
  arrange(desc(n_clusters))

# kijken welke markers uit de clusters er overeen komen in de top 10.
write_xlsx(dubbele_genen_30_R1, file.path(data_out, "dubbele_genen_30_R1.xlsx"))


