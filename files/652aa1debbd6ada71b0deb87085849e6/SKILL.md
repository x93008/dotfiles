---
name: Figma REST CLI
description: Use when a user provides a Figma URL or asks to inspect exact UI layout, colors, typography, screenshots, image assets, or export Figma nodes as SVG, PNG, PDF, or JPG.
slash: true
---

# Figma REST CLI

Use the `figma-api` executable through the shell tool.

## Safety

- Never ask the user to paste a Figma token, print it, or read its file directly.
- If authentication is missing or expired, ask the user to run `figma-api token set` in their terminal.
- Quote every Figma URL and output path.
- Store temporary downloads under `/tmp/opencode/` unless the user specifies another location.
- On HTTP 429, stop retrying and report the rate limit.

## Workflow

1. Confirm availability with `command -v figma-api`.
2. Parse the URL with `figma-api url '<figma-url>'`.
3. Fetch exact properties:

   ```bash
   figma-api layout '<figma-url>' --json > /tmp/opencode/figma-layout.jsonl
   ```

4. Download a visual reference when needed:

   ```bash
   mkdir -p /tmp/opencode/figma-output
   figma-api screenshot '<figma-url>' --scale=2 \
     --output=/tmp/opencode/figma-output/reference@2x.png
   ```

5. Export an exact node after identifying its file key and node ID:

   ```bash
   figma-api export '<file-key>' '<node-id>' --format=svg --scale=1 \
     --output=/tmp/opencode/figma-output/asset.svg

   figma-api export '<file-key>' '<node-id>' --format=png --scale=2 \
     --output=/tmp/opencode/figma-output/asset@2x.png
   ```

6. Verify outputs with `file /tmp/opencode/figma-output/*` and visually inspect image artifacts when possible.

## Exact design values

- Prefer JSON node properties over estimating values from screenshots.
- Convert normalized RGB channels with `round(channel * 255)` and report both HEX and RGBA.
- Preserve alpha and report any `boundVariables.color` variable ID.
- Identify nearby icons through parent/child relationships and bounding boxes; do not guess solely from appearance.
- Export the exact identified node. Use scale `1` for SVG and scale `2` for a requested 2x PNG.

## Errors

- `401`: token is invalid or expired.
- `403`: scope or resource permission is missing.
- `429`: rate limited; do not loop or immediately retry.
- Do not use `token set --no-verify` unless the user explicitly requests it.

Run `figma-api --help` for less common commands.
