#!/bin/bash
set -e -u -x

subid="$1"
wd=${PWD}

cd inputs/data
7z x ${subid}_freesurfer-*.zip
cd $wd

mkdir -p freesurfer/${subid}

bash ./freesurfer_tabulate/collect_stats_to_tsv.sh \
    ${subid} \
    ${PWD}/inputs/data/freesurfer \
    ${PWD}/fstabulate-containers/.datalad/environments/fmriprep-20-2-3/image \
    ${PWD}/fstabulate-containers/.datalad/environments/neuromaps-main/image \
    ${PWD}/freesurfer/${subid}

