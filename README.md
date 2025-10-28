# lncRNA_sc_seq  DLERPB

## Bioinformatica project over lncRNA's uit scRNAseq data van de embryogenese

### beschrijving project

Bij het project wordt er een pipeline gemaakt waarbij er gekeken wordt naar lncRNA's uit scRNAseq data van de embryogenese. Er wordt gekeken of de lncRNA's uit de data gefilterd kunnen worden en of dit wellicht nieuwe markers kan geven. De data analyse wordt gedaan door middel van Seurat in Rstudio. Er is eerst een tutoral uitgevoerd om te oefenen met Seurat. Hierna is de data van het onderzoek waarbij ze kijken naar het totaal RNA met [VASAseq](#0), gebruikt om te kijken naar lncRNA's. Eerst is alle data door de Seurat pipeline gehaald, hierna is er nog gekeken of de lncRNA's ook apart eruit gefilterd kunnen worden om specifieker te kijken of er nog nieuwe markers gevonden kunnen worden.

---

### project structuur

```         
project/
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

---

### Setup

### data
