---
layout: page
title: Research
permalink: /projects/
description: List of recent talks, released software, services, and collaborators.
nav: true
---

___
## Talks

* Can Firtina, **"Enabling Accurate, Fast, and Memory-Efficient Genome Analysis via Efficient and Intelligent Algorithms"**, Invited Talk, *[Department of Electrical Engineering and Computer Sciences](https://eecs.berkeley.edu)*, UC Berkeley, Berkeley, CA, United States, May 27 2022. [[Video]](https://www.youtube.com/watch?v=5C3FdBXrSlg) [[Slides pdf]](/assets/slides/2022-05-27-firtina-UCB-Seminar-EnablingFastEfficientGenomeAnalysis.pdf) [[Slides pptx]](/assets/slides/2022-05-27-firtina-UCB-Seminar-EnablingFastEfficientGenomeAnalysis.pptx)

* Can Firtina, **"Enabling Accurate, Fast, and Memory-Efficient Genome Analysis via Efficient and Intelligent Algorithms"**, Invited Seminar Talk, *[BIN590 Graduate Seminar in Bioinformatics](https://catalog.metu.edu.tr/course.php?prog=908&course_code=9080590), [Graduate School of Informatics](http://www.ii.metu.edu.tr/)*, Middle East Technical University, Virtual, January 10 2022. [[Video]](https://www.youtube.com/watch?v=Y4KMqvUYF-E) [[Slides pdf]](/assets/slides/2022-01-10-firtina-METU-GraduateSeminar-EnablingFastEfficientGenomeAnalysis.pdf) [[Slides pptx]](/assets/slides/2022-01-10-firtina-METU-GraduateSeminar-EnablingFastEfficientGenomeAnalysis.pptx)

* Can Firtina, **"Apollo: a sequencing-technology-independent, scalable and accurate assembly polishing algorithm"**, Workshop Talk, *ExaBiome/PASSION/SAFARI Workshop on Architectures and HPC for Genomics*, Virtual, May 26 2021. [[Video]](https://drive.google.com/file/d/1xujWwlTo1vvJ_3ujJ7L35s1mOvMSCLIG/view?usp=sharing) [[Slides pdf]](/assets/slides/2021-05-26-can-apollo-workshop.pdf) [[Slides pptx]](/assets/slides/2021-05-26-can-apollo-workshop.pptx)

___
## Selected Software

**BLEND:** BLEND is a mechanism that can efficiently find fuzzy (approximate) seed matches between sequences to significantly improve the performance and accuracy while reducing the memory space usage of two important applications: 1) finding overlapping reads and 2) read mapping. To achieve this, BLEND provides mechanisms to generate the same hash value for highly similar seeds such that BLEND can find fuzzy seed matches with a single lookup from the hash values of seeds. BLEND can be integrated into any seeding mechanism by properly replacing the hash functions of these seeding technqiues. As proof of work, we integrate the BLEND mechanism into [minimap2](https://github.com/lh3/minimap2/tree/7358a1ead1adfa89a2d3d0e72ffddd05732f9850) to generate the hash values for minimizer and strobemer seeds.

[GitHub Link](https://github.com/CMU-SAFARI/BLEND) \| [arXiv](https://doi.org/10.48550/ARXIV.2112.08687)

**AirLift:** As genome sequencing tools and techniques improve, researchers are able to incrementally assemble more accurate reference genomes, which enable sensitivity in read mapping and downstream analysis such as variant calling. A more sensitive downstream analysis is critical for better understanding the health data of a genome donor. Therefore, read sets from sequenced samples should ideally be mapped to the latest available reference genome. Unfortunately, the increasingly large amount of available genomic data makes it prohibitively expensive to fully re-map each read set to its respective reference genome every time the reference is updated. There are several tools that attempt to accelerate the process of updating a read data set from one reference to another (i.e., remapping) by 1) identifying regions that appear similarly between two references and 2) updating the mapping location of reads that map to any of the identified regions in the old reference to the corresponding similar region in the new reference. The main drawback of existing approaches is that if a read maps to a region in the old reference that does not appear similarly in the new reference, the read cannot be remapped. We find that, as a result of this drawback, a significant portion of annotations are lost when using state-of-the-art remapping tools. To address this major limitation in existing tools, we propose AirLift, a fast and comprehensive technique for moving alignments from one genome to another. AirLift reduces 1) the number of reads that need to be fully mapped from the entire read set by up to 99.99% and 2) the overall execution time to remap read sets between two reference genome versions by 19.6x, 6.6x, and 2.7x for large (human), medium (C. elegans), and small (yeast) reference genomes, respectively. We validate our remapping results with GATK and find that AirLift provides similar rates of identifying ground truth SNPs and INDELs as fully mapping a read set.

[GitHub Link](https://github.com/CMU-SAFARI/AirLift) \| [bioRxiv](https://www.biorxiv.org/content/10.1101/2021.02.16.431517v1)

**Apollo:** Third-generation sequencing technologies can sequence long reads that contain as many as 2 million base pairs. These long reads are used to construct an assembly (i.e. the subject’s genome), which is further used in downstream genome analysis. Unfortunately, third-generation sequencing technologies have high sequencing error rates and a large proportion of base pairs in these long reads is incorrectly identified. These errors propagate to the assembly and affect the accuracy of genome analysis. Assembly polishing algorithms minimize such error propagation by polishing or fixing errors in the assembly by using information from alignments between reads and the assembly (i.e. read-to-assembly alignment information). However, current assembly polishing algorithms can only polish an assembly using reads from either a certain sequencing technology or a small assembly. Such technology-dependency and assembly-size dependency require researchers to (i) run multiple polishing algorithms and (ii) use small chunks of a large genome to use all available readsets and polish large genomes, respectively.We introduce Apollo, a universal assembly polishing algorithm that scales well to polish an assembly of any size (i.e. both large and small genomes) using reads from all sequencing technologies (i.e. second- and third-generation). Our goal is to provide a single algorithm that uses read sets from all available sequencing technologies to improve the accuracy of assembly polishing and that can polish large genomes. Apollo (i) models an assembly as a profile hidden Markov model (pHMM), (ii) uses read-to-assembly alignment to train the pHMM with the Baum-Welch algorithm and (iii) decodes the trained model with the Viterbi algorithm to produce a polished assembly. Our experiments with real readsets demonstrate that Apollo is the only algorithm that (i) uses reads from any sequencing technology within a single run and (ii) scales well to polish large assemblies without splitting the assembly into multiple parts.

[GitHub Link](https://github.com/CMU-SAFARI/Apollo) \| [Paper](https://academic.oup.com/bioinformatics/article/36/12/3669/5804978?login=true)

___
## Services & Activities

  * Reviewer for BMC Bioinformatics, PACT, IEEE Micro, FAST, DSN, MICRO, ISCA, IEEE Transactions on Computers, ISCAS, ISPASS, HPCA, ASPLOS, USENIX ATC, and RECOMB.
  * Organized the [ExaBiome/PASSION/SAFARI Workshop on Architectures and HPC for Genomics](https://docs.google.com/document/d/18P82z6FU40PcAwMvb62ltQ1SBBxy6IIVQSlTdDJ8Jfo/edit) workshop with [Giulia Guidi](https://giuliaguidi.github.io). The workshop included 10 presenters from [ExaBiome](https://sites.google.com/lbl.gov/exabiome), [PASSION](https://passion.lbl.gov), and [SAFARI](https://safari.ethz.ch). May 26 2022, Virtual.

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