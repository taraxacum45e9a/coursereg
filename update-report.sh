#!/bin/bash
set -ex
source "$(dirname "$0")/commit.sh"

# A missing report (e.g. a round not yet published) must not abort the rest
cat <<URLS | wget --no-verbose -i - || true
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
URLS

shopt -s nullglob
for file in *.pdf; do
    cp "$file" "$DIR"
    commit_if_changed "$(date -r "$file" -Is)" "$file"
done
