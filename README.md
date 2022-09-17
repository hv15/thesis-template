Thesis Template
---------------

This repo contains the LaTeX template I am using for my PhD thesis.

Its main features are:
* out of source building (see `build/` directory for output)
* each chapter can be built individually (for easier revisions)
  * local bibliography for each chapter (merged for full thesis build)
* dynamic chapter addition/removal (using `ch[0-9]+\.` naming regex for chapter
  directories)
* build system is hierarchical, diagrams, chapters, and the thesis itself are all
  separately buildable (easier to diagnose issues in LateX)
* global configuration is managed separately
* use `latexmk` features, allowing for in-repo addition of LaTeX packages\
  (for cases where CTAN doesn't provide your custom package)

Extra stuff:
* Biblatex extended to include archive.org compatible fields in bibliographies

Layout
======

We use `subfile` to modularise thesis chapters into their own directory.
The top-level `thesis.tex` file is used to compile these all together. Each chapter,
that is sub-directory, can be compiled on its own.

```
.
├── ch1
│   ├── chapter1.tex
│   └── Makefile
├── ch2
│   ├── chapter2.tex
│   └── Makefile
├── ch3
│   ├── chapter3.tex
│   └── Makefile
├── ...
│   ...
│   ...
├── conf
│   ├── ...
│   └── ...
├── examples
│   ├── ...
│   └── ...
├── scripts
│   ├── ...
│   └── ...
├── Makefile
├── references.bib
├── thesis.tex
└── title.tex

```

### Auto-generated files

We auto generate several TeX files. One of these is a compilation of
configuration settings located in the `conf` directory. We do this to separate
out the configuration on a per-package basis. The generated file is called
`conf.tex`. It should be noted that potential conflicts between LaTeX packages
needs to be considered, as the compilation is done without any smartness.

We also generate a `input.tex`, which uses a script located in the `scripts`
directory to scan the top-level directory and generated the appropriate TeX
macros to includes all directories that start with `ch`. Again there is no
smartness here, and the order of the inputs is implicitly handled by the
filesystem (e.g. `ch0*` precedes `ch1*` and so forth).

### Setting up a chapter

There are only two hard requirements in order to add a new chapter:

1. created a directory in the top-level starting with `ch`.
1. in that directory, one should copy in the files located in the `examples`
   directory, which at a minimum must be a `Makefile` and the `chapter.tex`
   file.

CI
==

We can make use of Gitlab CI to ensure that things are building correctly. See the
`.gitlab-ci.yml` file for further details.

<!-- vim: set textwidth=80: -->
