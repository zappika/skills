# /identity

Give a live page the lightest coat of identity: a rich link-preview card and a favicon, both pulled from the project's own brand. Run it once there's a real page deployed — not before.

## When to run

After the first real, branded page is live on its domain. If there's no brand yet (canvas color, type, a mark or mascot, a tagline), stop — there's nothing to pull from. Identity comes from the design system; it isn't invented here.

## What you're producing

1. `og.png` — a 1200×630 share card (the standard Open Graph size)
2. `favicon.svg` + `favicon-32.png` + `apple-touch-icon.png` (180×180)
3. Open Graph + Twitter Card meta + favicon link tags in the page `<head>`
4. `og.html` + `icon.html` kept in the repo as regen sources, but excluded from the deploy via `.vercelignore` so they aren't served publicly

## Steps

### 1. Find the brand

Read CLAUDE.md, any design spec, and the existing components. Pull the real tokens: canvas color, ink, primary, fonts, the mark/mascot, the name, the tagline. If the mascot/mark is inline SVG, lift it verbatim — don't redraw it.

### 2. Build the share card (og.html → og.png)

Compose a 1200×630 poster from the brand: the mark/mascot, the wordmark, the tagline, the domain. It's a poster, not a screenshot of the UI — bold and legible at thumbnail size. Save it as `og.html`.

Rasterize to `og.png` with headless Chrome (raster, because WhatsApp/iMessage don't read SVG). Serve the file locally first, and use a virtual-time budget so web fonts load before capture:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --disable-gpu \
  --hide-scrollbars --force-device-scale-factor=1 --virtual-time-budget=4000 \
  --window-size=1200,630 --screenshot=og.png "http://localhost:PORT/og.html"
```

Keep it under ~600KB. Confirm it's 1200×630 and the fonts rendered (not fallback) by actually viewing the PNG.

### 3. Build the favicon set (icon.html → PNGs)

Make a square version of the mark on a full-bleed brand-color background — no rounded corners, no transparency (iOS renders transparent corners as black). Save as `icon.html`, render a 512 master with Chrome, downscale with `sips`:

```bash
cp master.png apple-touch-icon.png && sips -z 180 180 apple-touch-icon.png
cp master.png favicon-32.png && sips -z 32 32 favicon-32.png
```

Also write `favicon.svg` (rounded corners are fine here — tabs allow transparency). Check the 32px still reads as the mark by viewing it.

### 4. Wire the `<head>`

Absolute URLs only (`https://domain/og.png`), or the scrapers won't fetch them.

- Open Graph: `type`, `site_name`, `locale`, `url`, `title`, `description`, `image` (+ `image:type` / `width` / `height` / `alt`)
- Twitter: `card=summary_large_image`, `title`, `description`, `image`
- Icons: `rel=icon` svg, `rel=icon` png 32x32, `apple-touch-icon`
- A plain `<meta name="description">` and a real `<title>`

### 5. Keep the sources, don't serve them

Add `og.html` and `icon.html` to `.vercelignore` (create it if absent). They stay in the repo so the assets can be regenerated, but Vercel won't serve them — no stray `domain/og.html` floating around. The generated PNGs/SVG still deploy because they're not ignored.

### 6. Ship and verify

Commit, push, let it deploy. Then curl the live domain: the `og.png` / favicon endpoints return 200, the ignored HTML sources return 404, and the tags are present in the served HTML. Don't trust localhost — verify on the domain.

### 7. Tell Sarp about caching

WhatsApp / iMessage / Facebook and browser tabs cache previews and favicons hard. Already-shared links and open tabs show the old version until refreshed. To force fresh: Facebook's Sharing Debugger → "Scrape Again", or share `domain/?v=1` to dodge the cache.

## Rules

- Never invent identity here. Pull from the existing brand. If a real visual decision comes up — a composition that isn't obviously derived from the system — flag Sander, don't wing it.
- Raster (PNG) for the share image. WhatsApp and iMessage don't read SVG.
- Favicon / app-icon PNGs are full-bleed on a brand color — transparent corners go black on iOS.
- Absolute URLs in every meta tag.
- Keep `og.html` + `icon.html` in the repo so the assets can be regenerated, not reverse-engineered — but `.vercelignore` them so they're never served publicly.
- Verify on the live domain, not localhost.
- This is the lightest pass, not a brand system: share card + favicon. Don't gold-plate.
