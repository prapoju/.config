# Resource vocabulary for the COMP vault

Use ONLY values from this file when creating or editing meta files. Never
invent a new resource-type or tag.

## Rating scale

Mandatory `rating` field in every meta. Reflects the authority and reliability
of the source, NOT agreement with its content.

| rating | Meaning |
| ------ | ------- |
| 3 | Highly reliable: established experts, recognized organizations, authoritative sources with strong editorial/review standards (e.g. Linus Torvalds, Red Hat, Robert C. Martin, official project documentation, major academic publishers, recognized research institutions) |
| 2 | Reliable: authors with relevant formal education, professional expertise, or academic background (degree/PhD), but less established or widely recognized than level-3 sources |
| 1 | Unknown: the author's expertise, credentials, or identity cannot be sufficiently established from available information |

The `author` field is optional and may name a person or an organization/company
(e.g. Red Hat, IEEE Computer Society).

## Question field

Every meta has a mandatory `question` field: plain text stating the question
the resource answers (e.g. "How does the Linux kernel work internally?").
Prefer a single question; use a YAML list only when the resource answers
multiple distinct questions. It is plain text, not an Obsidian link, and does
not reference or create any note in `questions/`.

## Resource types

| resource-type | Description |
| ------------- | ----------- |
| book | Books, textbooks, monographs |
| paper | Academic/research papers |
| repository | Code repositories (GitHub, GitLab, etc.) that function as a resource |
| documentation | Official technical/API/tool documentation |
| wiki | Wikipedia, ArchWiki, community-maintained knowledge bases |
| blog | Blog posts and personal/company technical articles |
| website | General websites that don't fit another category |
| course | Courses, tutorials, lecture series |
| video | YouTube talks, lectures, conference talks, etc. |
| podcast | Podcast episodes/series |
| report | Industry reports, technical reports, white papers |
| thesis | Bachelor's/master's theses and dissertations |
| presentation | Slides/decks that function as a resource |
| forum | Stack Overflow, Reddit discussions, mailing-list discussions, etc. |

## Tags

Always hashtag-prefixed (e.g. `#linux`).

- #computer-science
- #linux
- #kernel
- #operating-systems
- #networking
- #file-system
- #virtual-memory
- #virtualization
- #software
- #software-architecture
- #programming
- #c
- #bash
- #scripting
- #shell
- #kernel-module
- #booting
- #debian
- #arch
- #red-hat
- #hardware
- #computer-architecture
- #security
- #cyber-security
- #logic
- #critical-thinking
- #philosophy
- #literature
- #essay
- #drawing
- #creativity
- #design-thinking
- #systems-thinking
- #innovation
- #ideas
- #communication
- #business
- #marketing
- #management
- #command
- #iot