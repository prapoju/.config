---
name: meta-new-resources
description: Create meta files for resources recently added to the COMP vault's resources/ directory that have no meta yet. Use when the user asks to "create metas for new resources", "meta the recently added files", "add missing metas", or when files were added to resources/ without a corresponding meta-*.md. Detects resources lacking a file: reference in resources-meta/ and loads the resource-meta skill for each.
---

## What I do
Find resources in the COMP vault's `resources/` directory that do not yet have
a meta file, then create one for each by delegating to the `resource-meta`
skill. Works in the COMP vault (the directory containing `resources/` and
`resources-meta/`).

## Steps

### 1. Locate the vault
The COMP vault is the directory containing both `resources/` and
`resources-meta/` (typically the working directory). If those folders are not
found in the cwd, ask the user for the vault path.

### 2. List resources
List the files in `resources/`. Keep only actual resources (`.pdf` and other
readable documents). Ignore non-resource files (e.g. `.ods`, `.tmp`, dotfiles).

### 3. Find which already have a meta
A resource counts as "already processed" if some `resources-meta/meta-*.md`
references it in its frontmatter via a `file: "[[<filename>]]"` link. Grep the
`file:` fields across `resources-meta/` and match them against the resource
filenames. Do NOT rely on matching meta filenames — names drift (e.g.
`what-is-enlightenment.pdf` → `meta-what-is-enlightement.md`).

### 4. Report the missing set
Show the user the list of resources that lack a meta. If there is more than a
handful (or any ambiguity), confirm before proceeding.

### 5. Create a meta for each
For each resource in the missing set, load the `resource-meta` skill (via the
skill tool) and follow its steps: skim the first ~3–5 pages with `pdf-to-md`,
present Decision A/B for the tags, propose `author` (optional), `rating`
(mandatory, 1–3, per the vocabulary's rating scale) and `question` (mandatory,
plain text), wait for approval, write the meta, verify.

### 6. Verify
Confirm every detected resource now has a matching `meta-*.md` in
`resources-meta/` with valid frontmatter.

## Notes
- Resource types and tags must come from the `resource-meta` skill's
  `vocabulary.md` — never invent new ones.
- Website-based metas (`url:` only, no `file:`) have nothing to detect against
  in `resources/`; leave them alone.
- A meta referencing a file that no longer exists in `resources/` (dangling
  meta) is out of scope — flag it to the user but do not act on it.