
# lncRNA_sc_seq DLERPB

Bioinformatica project over lncRNA's uit scRNAseq data van de embryogenese

------------------------------------------------------------------------

### beschrijving project

Bij het project wordt er een pipeline gemaakt waarbij er gekeken wordt naar lncRNA's uit scRNAseq data van de embryogenese. Er wordt gekeken of de lncRNA's uit de data gefilterd kunnen worden en of dit wellicht nieuwe markers kan geven. De data analyse wordt gedaan door middel van Seurat in Rstudio. Er is eerst een tutoral uitgevoerd om te oefenen met Seurat. Hierna is de data van het onderzoek waarbij ze kijken naar het totaal RNA met [VASAseq](#0), gebruikt om te kijken naar lncRNA's. Eerst is alle data door de Seurat pipeline gehaald, hierna is er nog gekeken of de lncRNA's ook apart eruit gefilterd kunnen worden om specifieker te kijken of er nog nieuwe markers gevonden kunnen worden.

------------------------------------------------------------------------

### project structuur

install.packages("fs")
fs::dir_tree(path = ".", recurse = 1)

```         
lncRNA_sc_splice/
├── README
├── lncRNA_sc_splice.Rproj
├── raw_data/
│   ├── hg19
│   └── raw_data_8_5
└── seurat/
    ├── Rmarkdown
    ├── analyse
    ├── bewerkte_data
    ├── referentie
    └── script
```
------------------------------------------------------------------------

### workflow

Als workflow wordt het volgende flowschema aangehouden: 

![afbeelding 1: workflow schema voor het beantwoorden van de deelvragen](afbeeldingen/workflow_schema.png)


Voor het onderzoek zijn de volgende onderzoeksvraag en deelvragen opgesteld:

Onderzoeksvraag: 

Kan een lncRNA-gerichte single-cell RNA-seq pipeline nieuwe, cell-type-specifieke markers identificeren tijdens de embryogenese?

Deelvraag 1:
Welke Seurat filteringparameters (min.features, percent.mt) zijn optimaal voor de gehele dataset en hoe beïnvloeden ze markeridentificatie? Welke markers komen tot expresie in de gehele dataset?

- Eerste stap is het inspecteren van de data, QC en bepalen filterin van percentage mt en features. Dit is verwerkt in de volgende Rmarkdown: /lncRNA_sc_seq/seurat/Rmarkdown/Data_8_5_analyse_1_QC.Rmd

- Tweede stap is het bepalen hoeveel PC's er meegenomen worden en wat de optimale resolutie is. Dit is verwerkt in de volgende Rmarkdown: /lncRNA_sc_seq/seurat/Rmarkdown/Data_8_5_analyse_2_PC_resolutie.Rmd 

Deelvraag 2:
Welke Seurat‑filteringparameters (min.features, percent.mt, variable.features.n,) zijn optimaal voor de lncRNA-only workflow en hoe beïnvloeden ze markeridentificatie? Welke markers komen tot expresie in de lncRNA-only workflow?

Deelvraag 3: 
Kunnen de clusters van de lncRNA-only analyse vergeleken worden met de gehele dataset?

Deelvraag 4: 
Hoe overlappen markers uit de lncRNA-only analyse met markers uit de gehele dataset, en wat zegt dit over de toegevoegde waarde van een lncRNA-gerichte pipeline?

Deelvraag 5:
Is het mogelijk om lncRNA-celmarkers te identificeren door de ruwe data te onderzoeken nadat de cellen zijn geclusterd?

------------------------------------------------------------------------

### Setup

Voor de dataverwerking zijn de volgende R-packages gebruikt:

-   `Seurat`

-   `dplyr`

-   `patchwork`

-   `data.table`

-   `ggplot2`

-   `here`

------------------------------------------------------------------------

### data

#### Seurat tutorial

Om te oefenen met Seurat is een tutorial uitgevoerd met test data. De data voor de Seurat [tutorial](https://satijalab.org/seurat/articles/pbmc3k_tutorial) is gedownload van de Seurat website.

Er is een script geschreven voor het downloaden van de data. Deze is te vinden onder `/lncRNA_sc_splice/seurat/scripts/downloaden_data_Seurat_tutorial`

Omdat de bestanden voor de tutoral niet al te groot zijn, zijn ze ook geplaatst onder `/lncRNA_sc_splice/raw_data`. In de Rmarkdown wordt hier ook naar verwezen met de `here` functie.

#### VASAseq

De data uit het onderzoek is al gedownload op de server. Dit is te vinden onder het volgende pad: `/home/data/projecticum/splicing/data/`. Omdat het om hele grote bestanden gaat is er voor gekozen om de data niet nog in het eigen project te zetten. Dit zou onnodig veel ruimte in beslag nemen. In de Rmarkdown is dus ook verwezen naar het bovenstaande pad.

De ruwe data van het onderzoek is te vinden bij de GEO website onder het volgende nummer: [GSE176588](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE176588).

------------------------------------------------------------------------

### auteur

Noa van Dam

email: Noa\@damvan.nl

------------------------------------------------------------------------
