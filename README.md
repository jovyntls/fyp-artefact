# Artefacts for 'Inconsistencies in TeX-produced PDF Documents'

This artefact contains data and runnable code the reproduction of results in our paper (_'Inconsistencies in TeX-produced PDF Documents'_), particularly the motivating study (Section 3), methodology (Section 4), and results (Section 5).

## Source Code

The source code of our automated pipeline can be found in `source-code/`.
Besides the end-to-end pipeline, this directory also includes supplementary scripts that may be useful for verifying results.
See `source-code/README.md` for details.

## Supplementary Data

Additional figures and data from study can be found at `supplementary-data/`.

## Motivating Study

The data for our motivating study can be found in the `motivating-study/` directory.
This includes the config and log files from the automated run, source data, and generated data.
The run results may be found in `motivating-study/raw-data/`.

This data was used for an alignment study to inform RQ1 and RQ2.
The results of the alignment study is documented in `motivating-study/alignment/`.

### Dataset

We used the following arXiV papers as source files in the motivating study:

arXiv ID   | document class | taxonomy
---------- | -------------- | --------
2306.00001 | IEEEtran       | cs.CV
2306.00002 | elsarticle     | physics.soc-ph
2306.00004 | llncs          | cs.SE
2306.00022 | mnras          | astro-ph.EP
2306.00036 | article        | cs.AI
2306.00057 | revtex4-1      | quant-ph
2306.00207 | amsart         | math.AG
2306.00417 | revtex4-2      | cond-mat.stat-mech
2306.01308 | revtex4        | nucl-th
2306.01691 | acmart         | cs.GR

These papers can be obtained directly from arxiv.org.
Running the pipeline to reproduce the motivating study will also automatically download the source files for these papers.

### Reproduction of motivating study

To reproduce the motivating study, 

1. Ensure software requirements are met using the "Getting Started > Requirements" instructions in `source-code/README.md`.
1. In the source code directory (`source-code/`), 
    1. In `source-code/utils/tex_engine_utils.py`: uncomment lines 1-3, and comment out lines 5-7
    1. Use the config file provided in `motivating-study/`, i.e.: replace `source-code/config.py` with `motivating-study/config.py`
    1. Ensure that the `PROJECT_ROOT` in `config.py` is correctly set to the (absolute) path of the source code directory.
1. Change the working directory: `cd source-code/`
1. Run the pipeline: `python3 main.py`. A summary of preliminary comparison results will be printed on the terminal.
1. Run analysis on the comparison methods: 
    1. `python3 run_text_based_comparison.py`
    1. `python3 run_img_comparison.py`

The above steps will reproduce section 3 of our paper.

**Interpreting the results**

The following directories (created automatically) may be helpful in interpreting the results:

* `source-code/bin_empirical/compiled_tex_pdf/`: This directory contains the PDFs compiled by each engine.
* `source-code/bin_empirical/diff_pdfs/`: This directory contains the results of pixel-wise comparisons between the compiled PDFs.
    * Filenames follow the format: `diff_<ARXIV_ID>_<ENGINE_1>_<ENGINE_2>.pdf`. 
        * e.g. `diff_2306.00001_xe_lua.pdf` is a pixel-wise comparison of the PDF produced by XeLaTeX against LuaLaTeX, for arXiV ID 2306.00001
    * The results of each engine are super-imposed with different colours to emphasise any inconsistencies. Thus, all orange and blue pixels represent inconsistencies.
        * e.g. for `diff_2306.00001_xe_lua.pdf`, blue pixels are present only in XeLaTeX output, orange pixels are present only in LuaLaTeX output, and grayscale pixels are present in both.
    * The column of red markings (on the left of each page) are visual indicators to highlight inconsistencies. A red marking indicates the presence of some inconsistency on the same row.
* `source-code/logs/`: This directory contains the results generated from running the pipeline.
    * `<TIMESTAMP>_results.csv`: A summary of the compilation and pixel-wise comparison results
    * `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
    * `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

The results are collated and formatted in an Excel sheet: `motivating-study/motivating-study-results.xlsx`.

### Reproduction of alignment study

The results of this pipeline (`motivating-study/motivating-study-results.xlsx`) were used in the alignment study described in Section 4.4 of our paper.
The inconsistencies found are detailed in `motivating-study/alignment/inconsistencies-from-motivating-study.md` (PDF version available as well).

---

## RQ1: TeX Engines

The data and results from RQ1 can be found in `rq1-tex-engines/`:
```
rq1-tex-engines
├── bin
├── logs
└── results_workbook_final.xlsx
```

### Reproduction of RQ1

To reproduce RQ1,

1. Ensure software requirements are met using the "Getting Started > Requirements" instructions in `source-code/README.md`.
1. In the source code directory (`source-code/`), 
    1. In `source-code/utils/tex_engine_utils.py`: uncomment lines 1-3, and comment out lines 5-7
    1. Use the config file provided in `rq1-tex-engines/`, i.e.: replace `source-code/config.py` with `rq1-tex-engines/config.py`
    1. Ensure that the `PROJECT_ROOT` in `config.py` is correctly set to the (absolute) path of the source code directory.
1. Change the working directory: `cd source-code/`
1. Run the pipeline: `python3 main.py`. 
    * Due to the size of the dataset, this might take a few hours. If you wish to run a concise demo of the pipeline, an quick way to do so would be to comment out some subjects in `source-code/constants/arxiv_subjects.py`.
1. Run analysis on the comparison methods: 
    1. `python3 run_text_based_comparison.py`
    1. `python3 run_img_comparison.py`

The above steps will reproduce section 5.1 of our paper.

**Interpreting the results**

The following directories (created automatically) may be helpful in interpreting the results:

TODO: this is the same as motivating study, except for the first bullet point

* `source-code/bin/compiled_tex_pdf/`: This directory contains the PDFs compiled by each engine, along with log files and other output from the compilation process.
* `source-code/bin/diff_pdfs/`: This directory contains the results of pixel-wise comparisons between the compiled PDFs.
    * Filenames follow the format: `diff_<ARXIV_ID>_<ENGINE_1>_<ENGINE_2>.pdf`. 
        * e.g. `diff_2306.00001_xe_lua.pdf` is a pixel-wise comparison of the PDF produced by XeLaTeX against LuaLaTeX, for arXiV ID 2306.00001
    * The results of each engine are super-imposed with different colours to emphasise any inconsistencies. Thus, all orange and blue pixels represent inconsistencies.
        * e.g. for `diff_2306.00001_xe_lua.pdf`, blue pixels are present only in XeLaTeX output, orange pixels are present only in LuaLaTeX output, and grayscale pixels are present in both.
    * The column of red markings (on the left of each page) are visual indicators to highlight inconsistencies. A red marking indicates the presence of some inconsistency on the same row.
* `source-code/logs/`: This directory contains the results generated from running the pipeline.
    * `<TIMESTAMP>_results.csv`: A summary of the compilation and pixel-wise comparison results
    * `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
    * `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

The results are collated and formatted in an Excel sheet: `rq1-tex-engines/results_workbook_final.xlsx`.


---

## RQ2: TeX Live Distributions

The results from RQ2 can be found in `rq2-texlive-distributions/`:

```
rq2-texlive-distributions
├── bin
├── results_default
└── results_with_flag
```

`results_default` contains the results for the initial run; 
`results_with_flag` contains the results running TL2020 with additional compilation flags.

---

## RQ3: Bugs

In RQ3, we studied 26 documents:
- 7 compile failures (4 root causes)
- 6 reversions (3 root causes)
- 13 changes from 2022->2023 (3 root causes)

The analysis of the root causes of inconsistencies in each of these documents can be found in `rq3-root-causes/` in subdirectories named with the arXiv ID of the document.

### Compile failures

arXiv ID   | 20 | 21 | 22 | 23 | root cause
---------- | -- | -- | -- | -- | -----
2306.00055 | Y  | Y  | Y  | Y  | (expected behaviour) syntax error by author
2306.00490 | Y  | Y  | Y  | Y  | (expected behaviour) syntax error by author
2306.00030 | Y  | Y  | Y  | Y  | (expected behaviour) syntax error by author
2306.00275 | Y  | N  | N  | N  | (expected behaviour) imported a package that did not exist yet [tabularray.sty]
2306.03822 | Y  | N  | N  | N  | (expected behaviour) imported a package that did not exist yet [tabularray.sty]
2306.05750 | Y  | N  | N  | N  | (fixed bug) adding a linebreak in footnotes breaks compilation
2306.00003 | N  | N  | N  | Y  | (reported bug) jmlr package

### Reverts

arXiv ID   | change | revert | root cause
---------- | ------ | ------ | ----------
2306.00001 |  2021  |  2023  | (fixed bug) siunitx package applying font styles
2306.01403 |  2021  |  2023  | (fixed bug) detection of eqnarray environment
2306.03237 |  2021  |  2023  | (fixed bug) detection of eqnarray environment
2306.00365 |  2021  |  2023  | (fixed bug) detection of eqnarray environment
2306.00746 |  2022  |  2023  | (fixed bug) handling newlines after the `\eqno` macro
2306.01235 |  2022  |  2023  | (fixed bug) handling newlines after the `\eqno` macro

### Changes from TL2022->TL2023

arXiv ID   | inconsistency                                    | root cause
---------- | ------------------------------------------------ | ----------
2306.00285 | inconsistent vertical spacing                    | (fixed bug) importing hyperref changes line spacing
2306.00052 | different horizontal spacing of tables           | (confirmed bug) importing the colortbl package changes horizontal spacing
2306.00329 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00415 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.01017 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00372 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00060 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.01838 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00269 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00510 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00537 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.00469 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character
2306.01515 | different spacing with tilde alignment character | (expected behaviour) due to redefining tilde character

