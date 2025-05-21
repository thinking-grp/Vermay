# Vermay: Version Management Format for Articles withby YAML front-matter Markdown

Official Dart implementation of Vermay, a lightweight binary diff format and versioning system for content files, designed for custom CMS integration.

A lightweight binary diff format and versioning system for content files, designed for custom CMS integration.
It supports per-file version indexing, content and metadata diffing, and bundling of revisions into structured barrels.
Optimized for fast processing with lightweight checksums and compact binary layout, while retaining logical traceability.

- Name:
  - Common: Vermay
  - Full: Version Management Format for Articles withby YAML front-matter Markdown
- File Extension:
  - Index Barrel: `*.ivb`
  - Diff Barrel: `*.svb`
- Mime Types:
  - Index Barrel: `application/x-vermay-ib`
  - Diff Barrel: `application/x-vermay-sb`
- Magic Number:
  - [0, 1] `0xbf, 0x80`: BOM-like Bytes "뾀" pron "BBWAEL"(Barrel Bytes W Article Entry Leader)
  - [2, 3] `0x23, 0x21`: Shebang-like ASCII "#!" 
  - [4, 7] `0xb2, 0xda, 0xc7, 0xdf`: EUC-JP "華梅" pron "huamei"
  - [8, 11] `0x89, 0xd8, 0x94, 0x7e`: Shift-JIS "華梅" pron "huamei"
  - [12, 13] `0x00, 0x01`: 2-bytes Unsigned Integer 1
  - [14] `0xb2`:  JIS X 0201 "い" pron "i" (for Index Barrel only)
  - [14] `0xc0`:  JIS X 0201 "た" pron "ta" (for Diff Barrel only)
  - [15] `0x3a`: ASCII ":"


## Overview on Data Structure

```
<diff-barrel> := <file-diff>* <checksum>
<file-diff> := <file-hash-id> <file-meta> <version-index> <bandle-versions> <single-versions>
<file-meta> := <file-name> <location-path> <created-at> <last-updated-at>
<version-index> := ((single | bandle) <hash-id> <datetime>)*
<bandle-versions> := <version>*
<single-versions> := <version>*
<version> := <hash-id> <datetime> <matter-diff>* <content-diff>* <checksum>
<matter-diff> := <yaml-path> (((cr | ud) <value>) | rm)
<content-diff> := <line> (del <position> <length>)* (ins <position> <value>)*
```

※Needless to say, variable items ― such as repeated entries and added values ― are prepended with their length or count, though.
