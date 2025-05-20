# Vermay: Version Management Format for Articles withby YAML front-matter Markdown

Official Dart implementation of Vermay, a lightweight binary diff format and versioning system for content files, designed for custom CMS integration.

A lightweight binary diff format and versioning system for content files, designed for custom CMS integration.
It supports per-file version indexing, content and metadata diffing, and bundling of revisions into structured barrels.
Optimized for fast processing with lightweight checksums and compact binary layout, while retaining logical traceability.

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
