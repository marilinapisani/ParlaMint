# ParlaMint-ES-CT
This unannotated corpus is compiled with the parliamentary sessions of the Parliament of Catalonia between the years 2015 and 2020. 

This corpus follows the [Parla-CLARIN recommendations](https://clarin-eric.github.io/parla-clarin/) proposed by the [CLARIN ParlaMint
project](https://www.clarin.eu/content/parlamint-towards-comparable-parliamentary-corpora). It is formed by 211 parliamentary transcriptions with the metadata of all the members of the parliament and their political party during the covered years. 

It contains a total of 11.7 million words in 39 585 utterances.

This Git contains the following folders: 

* Metadata: This folder contains all the files with the data from the members and political parties in the Parliament of Catalonia.
* ParlaMint-ES-CT.xml: This folder contains the root file and all the parliamentary transcriptions in TEI format for the unannotated corpus. 
* ParlaMint-ES-CT.ana: This folder contains the root file for the annotated version of the corpus. 
* Transcripts Parliament of Catalonia: This folder contains all the transcriptions of the sessions in docx format, before being converted to the TEI format.
* XSL: This folder contains the XSL file used to convert the transcripts from xml to TEI format. 
* Schema: This folder contains the schemas belonging to the CLARIN ParlaMint project that contains the schemas for validating the four types of files present in the corpora.
* Scripts: This folder contains the schemas belonging to the CLARIN ParlaMint project that contains the XSLT scripts (and their Perl wrappers) used to:
   * finalize the corpora submitted by the project partners to V2.1;
   * validate the corpora (in addition to schema validation also for links and metadata consistency); 
   * convert the TEI encoded corpora to derived formats.
