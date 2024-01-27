# Resume and Cover Letter Template

## Installation

On Ubuntu (or WSL), run the following commands:

```bash
sudo apt-get update
sudo apt-get -y install make
sudo apt install texlive
```

## Usage

In order for changes to be reflected in the PDF, you must run the `make` command from your terminal. This will automatically run the commands specified in the current directory's `Makefile`. There is a `Makefile` in the root directory of this repository, which will run the commands specified in both the `Makefile` in the `resume` directory and the `Makefile` in the `cover` directory.

## Making Changes

All of the content is written in [LaTeX](https://www.latex-project.org/), which is a markup language for typesetting documents. The `resume` directory contains the content for the resume, and the `cover` directory contains the content for the cover letter. Files are named according to the section they represent, and the `main.tex` file in each directory is the entry point for the document. The `Makefile` in each directory specifies how to compile the document into a PDF.

Follow the [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX) for help with writing LaTeX documents.
