# lncRNA_sc_seq DLERPB

Bioinformatica project over lncRNA's uit scRNAseq data van de embryogenese

------------------------------------------------------------------------

### beschrijving project

Bij het project wordt er een pipeline gemaakt waarbij er gekeken wordt naar lncRNA's uit scRNAseq data van de embryogenese. Er wordt gekeken of de lncRNA's uit de data gefilterd kunnen worden en of dit wellicht nieuwe markers kan geven. De data analyse wordt gedaan door middel van Seurat in Rstudio. Er is eerst een tutoral uitgevoerd om te oefenen met Seurat. Hierna is de data van het onderzoek waarbij ze kijken naar het totaal RNA met [VASAseq](#0), gebruikt om te kijken naar lncRNA's. Eerst is alle data door de Seurat pipeline gehaald, hierna is er nog gekeken of de lncRNA's ook apart eruit gefilterd kunnen worden om specifieker te kijken of er nog nieuwe markers gevonden kunnen worden.

------------------------------------------------------------------------

### project structuur

---

voor de bestandenstructuur is de volgende code gebruikt

```         
install.packages("fs")
fs::dir_tree(path = ".", recurse = 1)
```

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
    └── scripts
```

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

Er is een script geschreven voor het downloaden van de data. Deze is te vinden onder `/lncRNA_sc_splice/seurat/scripts/.......`.

Omdat de bestanden voor de tutoral niet al te groot zijn, zijn ze ook geplaatst onder `/lncRNA_sc_splice/raw_data`. In de Rmarkdown wordt hier ook naar verwezen met de `here` functie.

#### VASAseq

De data uit het onderzoek is al gedownload op de server. Dit is te vinden onder het volgende pad: `/home/data/projecticum/splicing/data/`. Omdat het om hele grote bestanden gaat is er voor gekozen om de data niet nog in het eigen project te zetten. Dit zou onnodig veel ruimte in beslag nemen. In de Rmarkdown is dus ook verwezen naar het bovenstaande pad.

De ruwe data van het onderzoek is te vinden bij de GEO website onder het volgende nummer: [GSE176588](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE176588).

------------------------------------------------------------------------

### auteur

Noa van Dam

email: Noa\@damvan.nl

------------------------------------------------------------------------
