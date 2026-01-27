#!/bin/bash

DIR=repo

export TZ=Asia/Singapore

set -ex

cat <<EOF | wget --no-verbose -i -
https://nus.edu.sg/coursereg/docs/DemandAllocationRptGD_R0.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptGD_R1.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptGD_R2.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptGD_R3.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptUG_R0.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptUG_R1.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptUG_R2.pdf
https://nus.edu.sg/coursereg/docs/DemandAllocationRptUG_R3.pdf
https://nus.edu.sg/coursereg/docs/VacancyRpt_AftR3.pdf
https://nus.edu.sg/coursereg/docs/VacancyRpt_R0.pdf
https://nus.edu.sg/coursereg/docs/VacancyRpt_R1.pdf
https://nus.edu.sg/coursereg/docs/VacancyRpt_R2.pdf
https://nus.edu.sg/coursereg/docs/VacancyRpt_R3.pdf
EOF

for file in *.pdf; do
    DATE=$(date -r $file -Is)
    if [ -f $DIR/$file ] && cmp -s $file $DIR/$file; then
        echo "No change in $file"
    else
        cp $file $DIR
        pushd $DIR
        git add $file
        git commit -m "Update $file to $DATE" --date="$DATE"
        popd
    fi
done
