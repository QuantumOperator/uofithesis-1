# Changelog

**Breaking changes** will be highlighted in each version, if there are any.
Breaking change would mean a change is needed in the `.tex` file to accommodate the changes in the document class.

## v1.4 - 2026-03-18

### Breaking Changes

Added the `\appendices` environment for better handling of appendices. This
both makes it easier to add appendices and fixes numbering and formatting issues.

To update your document, replace:

```diff
- % For an appendix without the chapter numbering, use \section* and add it to 
- % the table of contents manually with \addcontentsline
- \section*{Appendix A: Coffee Survey}
- \addcontentsline{toc}{section}{Appendix A: Coffee Survey}
+ \appendices{
+     \section{Coffee Survey}
```

Then subsections can be added as normal:

```latex
\subsection{Survey Questions}
```

## v1.3 - 2026-03-17

### Breaking Changes

- `fontsetup` has been moved from the document class to the template.
  Add `\usepackage{fontsetup}` to your `.tex` file to use the same fonts as before.

`fontsetup` tends to increase compilation time, so it is now optional. Include
fonts of your choice in the `.tex` file.

## v1.2 - 2026-03-03

Use the `pdfusetitle` option with `hyperref` instead of `hypersetup` for PDF metadata.

To update your document, remove `hypersetup:

```diff
-\AtBeginDocument{
-    \hypersetup{
-        pdftitle={\@title},
-        pdfauthor={\@author}
-    }
-}
```

And add the `pdfusetitle` option to the `hyperref` package:

```diff
-\usepackage[hidelinks]{hyperref}
+\usepackage[hidelinks,pdfusetitle]{hyperref}
```

## v1.1 - 2026-02-26

### Other Changes

These are *not* breaking changes.

- Add notes regarding TeXstudio usage.
- Remove `\subsubsection` from Table of Contents.
- Fix `\subsection` and `\subsubsection` formatting.
- Fix `\itemize` to not use `left-margin`, which isn't available in all environments.

## v1.0 - 2026-02-23

- Initial release.
