---
version: alpha
colors:
  paper:
    value: "#f5f2ec"
    role: "main background"
  ink:
    value: "#111111"
    role: "primary text"
  graphite:
    value: "#5f5a52"
    role: "secondary text"
  rule:
    value: "#d9d2c7"
    role: "hairline dividers"
  signal:
    value: "#c85f2d"
    role: "small interactive accent"
typography:
  display:
    fontFamily: "Arial, Helvetica, sans-serif"
    fontSize: "clamp(4.25rem, 13vw, 11rem)"
    lineHeight: "0.86"
  body:
    fontFamily: "Arial, Helvetica, sans-serif"
    fontSize: "1rem"
    lineHeight: "1.28"
  meta:
    fontFamily: "Arial, Helvetica, sans-serif"
    fontSize: "0.72rem"
    lineHeight: "1.25"
rounded:
  DEFAULT: "2px"
  image: "0px"
spacing:
  page: "clamp(1rem, 2vw, 1.75rem)"
  section: "clamp(2.5rem, 7vw, 6rem)"
components:
  photoStack:
    signature: "layered offset editorial images"
  nav:
    signature: "thin top rule with compact links"
---

## Overview

This is a single-page personal profile site in a brand/content register for 박채경, a makeup design researcher, artist, and lecturer. The visual north star is Samuel Medvedowsky's portfolio page: quiet white space, a thin navigation row, a large profession statement, and a layered photo stack that makes the hero feel personal without becoming a conventional resume.

The page should feel like an editorial index for a maker: direct, typographic, compact, and specific. It should avoid generic glass cards, oversized marketing gradients, rounded SaaS panels, and decorative blobs.

## Colors

The palette is warm off-white paper, black ink, graphite text, pale rules, and one restrained rust signal color. The accent is used only for focus rings, small marks, and hover states so the page stays typographic.

## Typography

Typography does most of the visual work. The display role is very large, tight, and plain; body text is compact and readable; metadata is small but not faint. The site uses system sans fonts so the GitHub Pages version loads quickly and avoids late font shifts.

## Layout

The first viewport uses an editorial split: photo stack on the left, oversized role statement on the right. The lower section turns into a two-column biography and metadata index. On narrow screens, the layout stacks while keeping the role headline first and the metadata readable.

## Elevation & Depth

Depth comes from physical layering in the photo stack and hairline rules, not shadows. Static text panels remain flat.

## Shapes

Edges are square or nearly square. Images may be slightly rotated to suggest stacked prints. Buttons and links use simple underline/rule treatments rather than pill shapes.

## Components

Navigation is compact and anchored to the top rule. The contact links are real anchors with visible hover and focus states. The signature component is the photo stack: three offset images, one primary and two secondary layers.

## Do's and Don'ts

Do keep the page spare, typographic, and image-led. Do let makeup research, color analysis, exhibition work, and university teaching supply the content structure. Do preserve strong contrast and semantic HTML. Don't add card grids, gradient orbs, animated gimmicks, or fake links.
