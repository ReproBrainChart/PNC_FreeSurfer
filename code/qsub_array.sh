#!/bin/bash
#$ -S /bin/bash
#$ -l h_vmem=8G
#$ -l h_rt=16:00:00
#$ -N fstabulate
#$ -cwd
#$ -t 1-1592
#$ -e /cbica/projects/RBC/freesurfer_stats/PNC/fs-tabulate/analysis/logs
#$ -o /cbica/projects/RBC/freesurfer_stats/PNC/fs-tabulate/analysis/logs
dssource=ria+file:///cbica/projects/RBC/freesurfer_stats/PNC/fs-tabulate/input_ria#da925640-e6e2-4c4b-ba6a-60af03fb9014
pushgitremote=/cbica/projects/RBC/freesurfer_stats/PNC/fs-tabulate/output_ria/da9/25640-e6e2-4c4b-ba6a-60af03fb9014
export DSLOCKFILE=/cbica/projects/RBC/freesurfer_stats/PNC/fs-tabulate/analysis/.SGE_datalad_lock

MAXWAIT=2700
sleeptime=$((RANDOM % MAXWAIT))
echo Sleeping for ${sleeptime}
sleep ${sleeptime}

batch_file_name=subject_ids.txt
subid=$(head -n ${SGE_TASK_ID} ${PWD}/code/${batch_file_name} | tail -n 1)
bash ${PWD}/code/participant_job.sh ${dssource} ${pushgitremote} ${subid}
