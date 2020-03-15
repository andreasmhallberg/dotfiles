This git repo contains a bunch of stuff (not only dotfiles) that I use in my daily life and work: config files, LaTeX-macros, Vim spellfiles, etc.,

Comments on files:

- `restore.sh`: shell script to download programs and set up config files.
- `aratrans.utf-8.add`: list of Arabic words in transcription used for spell checking in Vim.

## The `bin` directory

Commands to run in shell.

## The `mypandocstuff` directory

Files called when writing markdown.

- `beamermacros.tex`
- ~~`texttt-to-arabic.tex`: macros to use double backticks to write Arabic. Works also for beamer output. Use `\Arabic`/`\endAarabic` for longer sections. This also allows for LaTeX commands inside.~~ Use `[]{lang=ar}` instead
- `standard-settings.tex`: standard stuff for LaTeX. To be inputted in markdown YAML-header

## The `mylatexstuff` directory

- `tentamacros.tex`: macros for writing exams. Sourced in YAML-header/tex preamble.
- `ccbybottom.sty`: TeX package to place place ccby-silence at bottom of documents published on the blog.
- `kashidajustification.sty`: LaTeX package to justify Arabic text with kashdia.
- `bibliotek.bib`: general reference database. All references are dumped here in biblatex format. Reference keys are in the format `<first author surname>_<first word in title>_<YYYY>`. Author name is in non-capital ASCII, only alphanumerals.


