---
layout: page
title: Research
permalink: /projects/
description: List of recent talks, released software, services, and collaborators.
nav: true
---

___
## Talks

* Can Firtina, **"Enabling Accurate, Fast, and Memory-Efficient Genome Analysis via Efficient and Intelligent Algorithms"**, Invited Talk, *[Department of Electrical Engineering and Computer Sciences](https://eecs.berkeley.edu)*, UC Berkeley, Berkeley, CA, United States, May 27 2022.

* Can Firtina, **"Enabling Accurate, Fast, and Memory-Efficient Genome Analysis via Efficient and Intelligent Algorithms"**, Invited Seminar Talk, *[BIN590 Graduate Seminar in Bioinformatics](https://catalog.metu.edu.tr/course.php?prog=908&course_code=9080590), [Graduate School of Informatics](http://www.ii.metu.edu.tr/)*, Middle East Technical University, Virtual, January 10 2022. [[Video]](https://www.youtube.com/watch?v=Y4KMqvUYF-E) [[Slides pdf]](https://safari.ethz.ch/projects_and_seminars/fall2021/lib/exe/fetch.php?media=firtina-metu-graduateseminar-enablingfastefficientgenomeanalysis-january-10-2022.pdf) [[Slides pptx]](https://safari.ethz.ch/projects_and_seminars/fall2021/lib/exe/fetch.php?media=firtina-metu-graduateseminar-enablingfastefficientgenomeanalysis-january-10-2022.pptx)

___
## Selected Software

**BLEND:** BLEND is a mechanism that can efficiently find fuzzy seed matches between sequences to significantly improve the performance and accuracy while reducing the memory space usage of two important applications: 1) finding overlapping reads and 2) read mapping. Finding fuzzy seed matches enable BLEND to find both 1) exact-matching seeds and 2) highly similar seeds. We integrate the BLEND mechanism into [Minimap2](https://github.com/lh3/minimap2/tree/7358a1ead1adfa89a2d3d0e72ffddd05732f9850). We make the following changes in the original Minimap2 implementation:

- We enable the Minimap2 implementation so that it can find fuzzy seed matches using the BLEND mechanism as the original implementation can only find the exact-matching seeds between sequences. To this end, we change the [sketch.c](https://github.com/lh3/minimap2/blob/7358a1ead1adfa89a2d3d0e72ffddd05732f9850/sketch.c) implementation of Minimap2 so that 1) we can generate the seeds by concatanating each minimizer k-mer with its immediately preceding k-mers and 2) generate the hash values for seeds such that a pair of highly similar seeds can have the same hash value to find fuzzy seed matches with a single look-up.
- We enable the Minimap2 implementation to use seeds longer than 256 bases so that it can store longer seeds when using BLEND by combining the minimizer k-mer with *many* neighbor k-mers (e.g., hundreds), if necessary. The current implementation of Minimap2 allocates 8-bits to store seed lengths up to 256 characters. We change this requirement in various places of the implementation (e.g., [line 112 in sketch.c](https://github.com/lh3/minimap2/blob/7358a1ead1adfa89a2d3d0e72ffddd05732f9850/sketch.c#L112) and [line 239 in index.c](https://github.com/lh3/minimap2/blob/7358a1ead1adfa89a2d3d0e72ffddd05732f9850/index.c#L239)) so that BLEND can use 14 bits to store seed lengths up to 16384 characters. We do this because BLEND merges many k-mers into a single seed, which may be much larger than a 256 character-long sequence.

[GitHub Link](https://github.com/CMU-SAFARI/BLEND) \| [arXiv](https://arxiv.org/abs/2112.08687)

**AirLift:** As genome sequencing tools and techniques improve, researchers are able to incrementally assemble more accurate reference genomes, which enable sensitivity in read mapping and downstream analysis such as variant calling. A more sensitive downstream analysis is critical for better understanding the health data of a genome donor. Therefore, read sets from sequenced samples should ideally be mapped to the latest available reference genome. Unfortunately, the increasingly large amount of available genomic data makes it prohibitively expensive to fully re-map each read set to its respective reference genome every time the reference is updated. There are several tools that attempt to accelerate the process of updating a read data set from one reference to another (i.e., remapping) by 1) identifying regions that appear similarly between two references and 2) updating the mapping location of reads that map to any of the identified regions in the old reference to the corresponding similar region in the new reference. The main drawback of existing approaches is that if a read maps to a region in the old reference that does not appear similarly in the new reference, the read cannot be remapped. We find that, as a result of this drawback, a significant portion of annotations are lost when using state-of-the-art remapping tools. To address this major limitation in existing tools, we propose AirLift, a fast and comprehensive technique for moving alignments from one genome to another. AirLift reduces 1) the number of reads that need to be fully mapped from the entire read set by up to 99.99% and 2) the overall execution time to remap read sets between two reference genome versions by 19.6x, 6.6x, and 2.7x for large (human), medium (C. elegans), and small (yeast) reference genomes, respectively. We validate our remapping results with GATK and find that AirLift provides similar rates of identifying ground truth SNPs and INDELs as fully mapping a read set.

[GitHub Link](https://github.com/CMU-SAFARI/AirLift) \| [bioRxiv](https://www.biorxiv.org/content/10.1101/2021.02.16.431517v1)

**Apollo:** Third-generation sequencing technologies can sequence long reads that contain as many as 2 million base pairs. These long reads are used to construct an assembly (i.e. the subject’s genome), which is further used in downstream genome analysis. Unfortunately, third-generation sequencing technologies have high sequencing error rates and a large proportion of base pairs in these long reads is incorrectly identified. These errors propagate to the assembly and affect the accuracy of genome analysis. Assembly polishing algorithms minimize such error propagation by polishing or fixing errors in the assembly by using information from alignments between reads and the assembly (i.e. read-to-assembly alignment information). However, current assembly polishing algorithms can only polish an assembly using reads from either a certain sequencing technology or a small assembly. Such technology-dependency and assembly-size dependency require researchers to (i) run multiple polishing algorithms and (ii) use small chunks of a large genome to use all available readsets and polish large genomes, respectively.We introduce Apollo, a universal assembly polishing algorithm that scales well to polish an assembly of any size (i.e. both large and small genomes) using reads from all sequencing technologies (i.e. second- and third-generation). Our goal is to provide a single algorithm that uses read sets from all available sequencing technologies to improve the accuracy of assembly polishing and that can polish large genomes. Apollo (i) models an assembly as a profile hidden Markov model (pHMM), (ii) uses read-to-assembly alignment to train the pHMM with the Baum-Welch algorithm and (iii) decodes the trained model with the Viterbi algorithm to produce a polished assembly. Our experiments with real readsets demonstrate that Apollo is the only algorithm that (i) uses reads from any sequencing technology within a single run and (ii) scales well to polish large assemblies without splitting the assembly into multiple parts.

[GitHub Link](https://github.com/CMU-SAFARI/Apollo) \| [Paper](https://academic.oup.com/bioinformatics/article/36/12/3669/5804978?login=true)

___
## Services

  * Reviewer for BMC Bioinformatics, PACT, IEEE Micro, FAST, DSN, MICRO, ISCA, IEEE Transactions on Computers, ISCAS, ISPASS, HPCA, ASPLOS, USENIX ATC, and RECOMB.

___
## Collaborators
  * Onur Mutlu (ETH Zurich)
  * Can Alkan (Bilkent University)
  * Damla Senol Cali (Bionano Genomics)
  * Jeremie S. Kim (Apple)
  * Sreenivas Subramoney (Intel Labs)
  * Gurpreet S. Kalsi (Intel Labs)
  * Kamlesh Pillai (Intel Labs)
  * Taha Shahroodi (TU Delft)
  * Juan Gomez-Luna (ETH Zurich)
  * Mohammed Alser (ETH Zurich)
  * Giulia Guidi (UC Berkeley)
  * Joel Lindegger (ETH Zurich)
  * Nour Almadhoun Alserr (ETH Zurich)
  * Nika Mansouri Ghiasi (ETH Zurich)
  * Jisung Park (ETH Zurich)
  * Gagandeep Singh (ETH Zurich)
  * Konstantinos Kanellopoulos (ETH Zurich)
  * Saugata Ghose (University of Illinois Urbana-Champaign)
  * A. Ercument Cicek (Bilkent University)
  * Levent Onural (Bilkent University)
  * Ziv Bar-Joseph (Carnegie Mellon University)
  * Oznur Tastan (Sabanci University)