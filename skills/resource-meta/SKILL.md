---
name: resource-meta
description: Create a resource meta file for a website or local file in the COMP vault. Use when the user asks to "create a meta", "make a meta", or "add meta" for a website or PDF. Produces resources-meta/meta-<website-name>.md with YAML frontmatter (type, resource-type, url or file, author, rating, question, tags).
---

## What I do
Create a single markdown meta file describing a website (or local file) so the
COMP vault can index it as a resource. Output goes to `resources-meta/` with
filename `meta-<website-name>.md`, where website-name is derived from the
domain/subdomain (e.g. `https://naranjorange.medium.com/...` →
`meta-naranjorange.md`). If the user supplies their own name (e.g. "call it
innovation"), use that instead.

## Controlled vocabulary
Read `vocabulary.md` (in this skill's directory) before choosing a
resource-type or tags. Use ONLY values from it; never invent new ones.

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
Choose one value from `vocabulary.md` (e.g. `book`, `documentation`, `wiki`,
`course`, `website`). Match similar existing metas in `resources-meta/`.

### 4. Evaluate the resource and decide tags
Before assigning tags, ground the decision in the resource itself:

1. **Local PDF** → read the first ~3–5 pages (cover, TOC, intro) via the
   `pdf-to-md` skill. Do not read the whole document.
2. **Website** → `webfetch` the page itself.
3. **Fallback** → only if neither reading nor your own knowledge reveals the
   subject, use `websearch`. If the resource is still unclassifiable, say so
   instead of inventing tags.

Then present exactly ONE decision to the user, using the format below.

**Decision A — existing tags suffice:**
> "The existing tags which describe this resource are `#x` + `#y` + `#z`.
> I think these tags are good enough."

**Decision B — propose new tags:**
> "But I suggest you create these tags: `#a` + `#b`. I'll leave the final
> metadata like this:

```markdown
---
type: resource
resource-type: <book|documentation|...>
file: "[[name.pdf]]"
author: "Author Name"
rating: 3
question: "What question does this resource answer?"
tags:
  - "#a"
  - "#b"
---
```"

Use 2–4 tags, only from `vocabulary.md`, hashtag-prefixed. Reuse tags already
present in other `resources-meta/` files when relevant.

**Never write the meta until the user approves the tags.**

### 4b. Determine author (optional) and rating (mandatory)

**author** — optional. Name of the primary author/creator. May be a person or
an organization/company (e.g. Red Hat, IEEE Computer Society, Linux Kernel
Community). Propose one tentative author based on your existing
knowledge/memory — this is only an initial proposal, not certain. If unknown
or ambiguous:
- Propose a tentative author from your knowledge, OR
- Use the **question tool** to ask whether the user wants you to research the
  resource online to identify or verify the author, OR
- Ask the user directly, OR
- Omit the `author` field when no reliable author can be established.

If the resource has multiple authors, include the relevant authors when known.

**rating** — mandatory. Value from 1–3 representing perceived reliability and
authority of the source (NOT agreement with its content):

- **3 — Highly reliable:** established experts, recognized organizations,
  authoritative sources with strong editorial/review standards (e.g. Linus
  Torvalds, Red Hat, Robert C. Martin, official project documentation, major
  academic publishers, recognized research institutions).
- **2 — Reliable:** authors with relevant formal education, professional
  expertise, or academic background (degree/PhD), but less established or
  widely recognized than level-3 sources.
- **1 — Unknown:** the author's expertise, credentials, or identity cannot be
  sufficiently established from available information.

Propose a tentative rating from your knowledge/memory. If uncertain, use the
**question tool** to ask whether the user wants you to research the
author/source online before assigning or confirming the rating. Do NOT
automatically perform online research unless the user chooses that option
through the question tool.

### 4c. Determine the question (mandatory)

**question** — mandatory. Plain text stating the question the resource answers.
Based on the skim from step 4 and your knowledge, propose what the resource is
answering. Write it as a natural-language question (e.g. "How does the Linux
kernel work internally?").

- Prefer a SINGLE question. Use a YAML list (`question: ["q1", "q2"]`) only
  when the resource genuinely answers multiple distinct questions.
- It is plain text, not an Obsidian link, and does not reference or create any
  note in `questions/`.
- Include it in the Decision A/B proposal; never write the meta until the user
  approves the question.

### 5. Write the meta file
Use this shape (mirrors `meta-arch-wiki.md`):

```markdown
---
type: resource
resource-type: <book|documentation|...>
url: <full-url>
author: "Author Name"
rating: 3
question: "What question does this resource answer?"
tags:
  - "#tag1"
  - "#tag2"
---
```

For local files, use `file: "[[name.pdf]]"` instead of `url:`.

`rating` and `question` are always required. `author` is optional — include it
only when known or tentatively established with the user's approval.

### 6. Verify
Confirm the file exists at `resources-meta/meta-<website-name>.md`, has no
duplicates, and frontmatter matches the template.

## Notes
- Never create a meta that already exists — check `resources-meta/` first and
  update instead if the name matches.
- Keep tags minimal and consistent with the existing vault.