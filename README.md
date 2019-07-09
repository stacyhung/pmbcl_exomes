# Primary Mediastinal B-Cell Lymphoma (PMBCL) exomes

## Study design
- 95 tumor samples
- 21 matching normals
- Whole exome sequencing performed on all samples (average 115X)


## Variant calling
Tumor samples with a matching normal were analyzed using a paired analysis.  For unpaired samples, tumors were matched against a pooled normal (10 of the 21 normals downsampled and merged).  The following callers were applied to determine somatic nucleotide variants and indels:
- VarScan
- MuTect
- Strelka
- MutSig to identify significantly mutated genes

## Copy number detection
- CNVkit
- GISTIC to identify signficant amplications and deletions
