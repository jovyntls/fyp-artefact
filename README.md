# Artefacts for 'Inconsistencies in TeX-produced PDF Documents'

## Source Code

The source code of our automated pipeline can be found in `source-code/`.
Besides the end-to-end pipeline, this directory also includes supplementary scripts that may be useful for verifying results.
See `source-code/README.md` for details.

## Supplementary Data

Additional figures and data from study can be found at `supplementary-data/`.

## Motivating Study

The data for our motivating study can be found in the `motivating-study/` directory.
This includes the config and log files from the automated run, source data, and generated data.

This data was used for an alignment study to inform RQ1 and RQ2.
The results of the alignment study is documented in `motivating-study/alignment/`.

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

---

## RQ1: TeX Engines

The results from RQ1 can be found in `rq1-tex-engines/`:
```
rq1-tex-engines
├── bin
├── logs
└── results_workbook_final.xlsx
```

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

