---
name: pdf-to-md
description: Convert PDF documents to Markdown using Python (pymupdf4llm). Produces high-fidelity markdown with headers, lists, and tables preserved.
license: MIT
compatibility: opencode
metadata:
  audience: all
  workflow: document-conversion
---

## What I do
Convert a PDF file to a Markdown (.md) file using Python's `pymupdf4llm` library, which extracts text with headings, lists, and tables preserved.

## When to use me
Use this when the user provides a PDF and wants its contents as Markdown, or when a PDF cannot be read natively by the model. Ask for the input path if it is not provided.

## How to convert

### 1. Ensure the dependency is installed
```bash
python3 -m pip install pymupdf4llm
```

### 2. Convert the PDF
Run a Python script using `pymupdf4llm.to_markdown()`. By default save the output next to the source PDF with the same basename.

```python
import pymupdf4llm
import pathlib
import sys

src = pathlib.Path(sys.argv[1])
md = pymupdf4llm.to_markdown(str(src))
dest = src.with_suffix(".md")
dest.write_text(md, encoding="utf-8")
print(dest)
```

Pass the input PDF as the first argument. The output is written to `<same-basename>.md` in the same directory.

## Notes
- If the user requests a specific output path, pass it as a second argument and write there instead.
- If the PDF is corrupt or unreadable, report the error and suggest verifying the file.
- After converting, confirm the output file exists and is non-empty, and report its full path.