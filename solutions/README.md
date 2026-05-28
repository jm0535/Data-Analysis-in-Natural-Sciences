# Instructor Solutions

**Audience:** Instructors and teaching assistants. Not distributed with the student-facing book.

**Branch:** `instructor-solutions` (kept off `main`; do not merge).

## Contents

One file per chapter mirroring `chapters/NN-*.qmd` exercise numbering. Each
solution is a runnable `.qmd` chunk that loads the relevant dataset from
`../data/`, performs the analysis, and ends with a brief interpretation
suitable for marking guidance.

## How to use

```bash
git checkout instructor-solutions
quarto render solutions/05-statistical-tests.qmd --to html
```

The rendered HTML lives in `solutions/_render/` (gitignored) and should
**not** be committed.

## Coverage status

- **Full solutions:** chapters 3, 4, 5 (statistics core)
- **Skeleton with prompts:** chapters 1, 2, 6, 7, 8, 9, 10

To expand a skeleton, follow the pattern in `05-statistical-tests.qmd`:
load data → run analysis → interpret in 2-3 sentences → note common
student pitfalls in a callout-tip.

## Policy

The preface states that worked solutions are not bundled with the book by
design — students build fluency by iterating on their own attempts. These
instructor solutions exist for grading consistency only. **Do not** post
them publicly, attach them to a public release, or distribute them to
students before the assessment window closes.
