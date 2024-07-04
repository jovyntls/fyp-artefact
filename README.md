# Artefacts for 'Inconsistencies in TeX-produced PDF Documents'

This artefact contains data and runnable code the reproduction of results in our paper (_'Inconsistencies in TeX-produced PDF Documents'_), particularly the motivating study (Section 3), methodology (Section 4), and results (Section 5).

# Getting Started

## Requirements

* Python 3.9
* A Python environment with the required packages (`pip install -r requirements.txt`)
* [diff-pdf](https://github.com/vslavik/diff-pdf)
* [Docker](https://docs.docker.com/get-docker/) (only required for reproducing RQ2)

## Running a quick demo

The following steps will run the pipeline on a small sample of 10 documents.

1. Change the working directory: `cd source-code/`
1. Set the `PROJECT_ROOT` in `config.py` to the path of the source code directory (i.e., the output of `pwd`).
    * For example, `PROJECT_ROOT = '/PATH/TO/THIS/DIRECTORY/source-code/'`
1. Run the pipeline: `python3 main.py`. A summary of preliminary comparison results will be printed on the terminal.
1. Run comparisons and analysis: 
    1. `python3 run_text_based_comparison.py`
    1. `python3 run_img_comparison.py`

## Interpreting the results

The following directories (created automatically) may be helpful in interpreting the results:

* `source-code/bin_tmp/compiled_tex_pdf/`: This directory contains the PDFs compiled by each engine, along with log files and other output from the compilation process.
* `source-code/bin_tmp/diff_pdfs/`: This directory contains the results of pixel-wise comparisons between engines for each of the compiled PDFs.
    * Filenames follow the format: `diff_<ARXIV_ID>_<ENGINE_1>_<ENGINE_2>.pdf`. 
        * e.g. `diff_2306.00001_xe_lua.pdf` is a pixel-wise comparison of the PDF produced by XeLaTeX against LuaLaTeX, for arXiv ID 2306.00001
    * The results of each engine are super-imposed with different colours to emphasise any inconsistencies. Thus, all orange and blue pixels represent inconsistencies.
        * e.g. for `diff_2306.00001_xe_lua.pdf`, blue pixels are present only in XeLaTeX output, orange pixels are present only in LuaLaTeX output, and grayscale pixels are present in both.
    * The column of red markings (on the left of each page) are visual indicators to highlight inconsistencies. A red marking indicates the presence of some inconsistency on the same row.
* `source-code/logs/`: This directory contains the results generated from running the pipeline.
    * `<TIMESTAMP>_results.csv`: A summary of the compilation and pixel-wise comparison results
    * `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
    * `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

# Detailed Description

## Source Code

The source code of our automated pipeline can be found in the `source-code/`, or on [Github](https://github.com/jovyntls/inconsistencies-in-tex).

Besides the end-to-end pipeline, this directory also includes supplementary scripts that may be useful for verifying and analysing results.
See `source-code/README.md` for details.

## Motivating Study

The data for our motivating study can be found in the `motivating-study/` directory.
This includes the config and log files from the automated run, source data, and generated data.
The run results may be found in `motivating-study/raw-data/` and `motivating-study/bin/`.

This data was used for an alignment study to inform RQ1 and RQ2.
The results of the alignment study is documented in `motivating-study/alignment/`.

### Dataset

We used the following arXiv papers as source files in the motivating study:

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

1. Ensure software requirements are met (see "Getting Started > Requirements" above).
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

The following files (created automatically in `source-code/logs/`) contain the results of this run:

* `<TIMESTAMP>_results.csv`: A summary of the compilation and pixel-wise comparison results
* `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
* `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

These results are collated and formatted in an Excel sheet: `motivating-study/motivating-study-results.xlsx`.

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

1. Ensure software requirements are met (see "Getting Started > Requirements" above).
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

The following files (created automatically in `source-code/logs/`) contain the results of this run:

* `<TIMESTAMP>_results.csv`: A summary of the compilation and pixel-wise comparison results
* `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
* `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

These results are collated and formatted in an Excel sheet: `rq1-tex-engines/results_workbook_final.xlsx`.


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

### Reproduction of RQ2

To reproduce RQ2,

1. Ensure software requirements are met (see "Getting Started > Requirements" above).
1. In the source code directory (`source-code/`), 
    1. In `source-code/utils/tex_engine_utils.py`: comment out lines 1-3, and uncomment lines 5-7
    1. Use the config file provided in `rq2-texlive-distributions/`, i.e.: replace `source-code/config.py` with `rq2-texlive-distributions/config.py`
    1. Ensure that the `PROJECT_ROOT` in `config.py` is correctly set to the (absolute) path of the source code directory.
1. Change the working directory: `cd source-code/`
1. To compile with a specific version (e.g. TeX Live 2020):
    1. Build the Docker image: `docker build -t tex2020 -f ./version_cmp/tl2020.Dockerfile .`
    1. Start a Docker container with a volume: `docker run -ti -v /<REPLACE_THIS_WITH_YOUR_PATH>/source-code/version_cmp/docker_bin_2:/diff_test_tex_engines/docker_bin_2 --name run2020 tex2020`
    1. Run compilation (you should now be in the Docker container): `python3 run_compile_only.py -ver 2020`. 
    1. Exit the Docker container: `exit`
1. Repeat the above steps to compile with TL2020, TL2021, TL2022 and TL2023.
1. Run analysis on the comparison methods:
    1. `python3 run_text_based_comparison.py`
    1. `python3 run_img_comparison.py`

The above steps will reproduce section 5.2 of our paper.

**Interpreting the results**

The following directories (created automatically) may be helpful in interpreting the results:

* `source-code/version_cmp/docker_bin/version_compiled_pdf/`: This directory contains the PDFs compiled by each TeX Live distribution, along with log files and other output from the compilation process.
* `source-code/logs/`: This directory contains the results generated from running the pipeline.
    * `<TIMESTAMP>_analysis_results.csv`: Detailed results of text- and font-based comparisons
    * `<TIMESTAMP>_imgcompare.csv`: Results of feature-based comparisons

The results are collated and formatted in an Excel sheet: `rq2-texlive-distributions/version_results_3.xlsx`.

### Reproduction of "Breaking changes in compilation flags"

1. Compile TL2020 with additional compilation flags:
    1. Enter the Docker container for TL2020: `docker start run2020 && docker exec -it run2020 /bin/bash`
    1. Run compilation with updated compilation flags: `python3 run_compile_only.py -ver 2020 -flags`
    1. Exit the Docker container: `exit`

**Interpreting the results**

* Compilation output will be saved in `version_compiled_pdf_2020/` instead of `version_compiled_pdf/`.

---

## RQ3: Bugs

In RQ3, we studied 26 documents:
- 7 compile failures (4 root causes)
- 6 reversions (3 root causes)
- 13 changes from 2022->2023 (3 root causes)

The analysis of the root causes of inconsistencies in each of these documents can be found in `rq3-root-causes/` in subdirectories named with the arXiv ID of the document.
Each subdirectory contains the original TeX source files (`source/`), compilation output (`out/`), and notes detailing the inconsistency (`notes_XXXXX.md`).
Wherever relevant, a minimum working example is included as well (`mwe/`).

The 26 documents are summarised below:

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

## Extensions

**Reusing the pipeline**

This pipeline can be re-run on an entirely different sample of papers by changing the `YEAR_AND_MONTH` in `source-code/config.py` (which will run the pipeline on papers from a different time period).
Additionally, increasing `NUM_ATTEMPTS` will increase the sample size by downloading a greater number of papers.

**Debugging**

Detailed logs may be found in the `source-code/logs/` directory (usually named `<TIMESTAMP>.log`).

Logs are printed to the console as well.
The log level can be changed by setting the `console_log_level` argument (e.g., `console_log_level=logging.DEBUG`).

**Additional functionality**

The following scripts provided in `source-code/` may be helpful in interpreting results:

* Count the number of pages in _all_ PDFs
    * `python3 run_analysis.py -count-pages` (add `-save` to save the results to a CSV file)
* Count the number of compiled PDFs in for each engine
    * `python3 run_analysis.py -count-compiled` (add `-save` to save the results to a CSV file)
* Highlight the differences between two PDFs
    * `python3 run_diff_highlight.py -id 01308 -pg 1 3 5` for the arXiv ID {YEAR_AND_MONTH}.01308 on pages 1,3,5

