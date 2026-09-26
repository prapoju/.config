---
name: resource-meta
description: Create a resource meta file for a website or local file in the COMP vault. Use when the user asks to "create a meta", "make a meta", or "add meta" for a website or PDF. Produces resources-meta/meta-<website-name>.md with YAML frontmatter (type, resource-type, url or file, tags).
---

## What I do
Create a single markdown meta file describing a website (or local file) so the
COMP vault can index it as a resource. Output goes to `resources-meta/` with
filename `meta-<website-name>.md`, where website-name is derived from the
domain/subdomain (e.g. `https://naranjorange.medium.com/...` →
`meta-naranjorange.md`). If the user supplies their own name (e.g. "call it
innovation"), use that instead.

## Steps

### 1. Get the URL or path
Ask for the URL if not provided. A website has a `url:` field; a local file
(e.g. PDF) has a `file:` field as a `[[...]]` Obsidian link.

### 2. Determine the website name
Derive from the URL:
- Subdomain/site portion of the domain, slugified and lowercased.
- Example: `https://wiki.archlinux.org/title/Main_page` → `arch-wiki` →
  `meta-arch-wiki.md`
- Example: `https://naranjorange.medium.com/...` → `naranjorange` →
  `meta-naranjorange.md`

Use the user's custom name if they give one ("call it X").

### 3. Determine resource-type
Choose from existing conventions: `wiki`, `book`, `documentation`, `game`,
`article`, `blog`, etc. Match similar existing metas in `resources-meta/`.

### 4. Research and pick tags
Fetch or search the site to understand its subject. Choose 2-4 hashtag-prefixed
tags following the vault's style (e.g. `#linux`, `#computer-science`,
`#innovation`). Reuse tags already present in other `resources-meta/` files
when relevant.

### 5. Write the meta file
Use this shape (mirrors `meta-arch-wiki.md`):

```markdown
---
type: resource
resource-type: <wiki|book|documentation|...>
url: <full-url>
tags:
  - "#tag1"
  - "#tag2"
---
```

For local files, use `file: "[[name.pdf]]"` instead of `url:`.

### 6. Verify
Confirm the file exists at `resources-meta/meta-<website-name>.md`, has no
duplicates, and frontmatter matches the template.

## Notes
- Never create a meta that already exists — check `resources-meta/` first and
  update instead if the name matches.
- Keep tags minimal and consistent with the existing vault.