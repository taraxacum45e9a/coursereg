# coursereg

Scheduled GitHub Actions that archive NUS course-registration data, one git
commit per upstream change, dated to when the source was last modified.

| Branch             | Contents                                                     | Source                                    | Updated by                          |
| ------------------ | ------------------------------------------------------------ | ----------------------------------------- | ----------------------------------- |
| `coursereg-report` | CourseReg demand/allocation and vacancy report PDFs          | <https://nus.edu.sg/coursereg/>           | `update-report.sh`                  |
| `soc-sched`        | SoC course schedules (regular and special term), HTML + JSON | <https://www.comp.nus.edu.sg/cug/soc-sched/> | `update-sched.sh`, `clean-sched.py` |

## Running locally

```sh
pip install -r requirements.txt
git worktree add repo soc-sched   # or coursereg-report
./update-sched.sh                 # or ./update-report.sh
```
