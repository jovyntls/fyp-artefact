#!/bin/bash

read arxiv_id
arxiv_id=$(printf %05d $arxiv_id)

full_arxiv_id="2306.$arxiv_id"

mkdir $full_arxiv_id

cp -r ../../diff_test_tex_engines/bin/arxiv_tars_extracted/$full_arxiv_id $full_arxiv_id/source

cp -r ../../diff_test_tex_engines/version_cmp/docker_bin_2/version_compiled_pdf/$full_arxiv_id $full_arxiv_id/out
rm $full_arxiv_id/out/*tl2020*
rm $full_arxiv_id/out/logs/*tl2020*

cp ../../diff_test_tex_engines/version_cmp/docker_bin_2/version_compiled_pdf_2020/$full_arxiv_id/*tl2020* $full_arxiv_id/out
cp ../../diff_test_tex_engines/version_cmp/docker_bin_2/version_compiled_pdf_2020/$full_arxiv_id/logs/* $full_arxiv_id/out/logs

cp notes_template.md $full_arxiv_id/notes_$arxiv_id.md
