# 家具设计作品集 · Furniture Design Portfolio

A restrained, gallery-style portfolio site for an interior furniture designer.
One self-contained `index.html` — no framework, no build step, no dependencies.

**Live:** https://portfolio.angelymha.workers.dev

---

## What's in here

```
index.html        the working copy — markup, styles and behaviour
favicon.png       site mark
public/           what actually gets deployed (only these 2 files are uploaded)
wrangler.jsonc    Cloudflare Worker config
sync.sh           copies index.html + favicon.png into public/
.github/          auto-deploy workflow
```

All photography is served from a CDN, so there is no `img/` folder to keep in
sync — the page references absolute URLs.

**After editing `index.html`, run `./sync.sh`** so `public/` picks up the change.
The deploy workflow runs it automatically, but doing it locally keeps the two
copies from drifting apart in git.

## Editing

Everything lives in `index.html`:

| What | Where |
|---|---|
| Colours | `:root` block at the top — `--paper`, `--ink`, `--rule` |
| Typography | `--sans` stack; Manrope for Latin, Noto Sans SC for Chinese |
| Spacing scale | `--s-1` … `--s-7` |
| Hero headline | `<h1 class="display hero-title zh">` |
| Categories | `<button class="cat">` + the matching `<div class="cat-gallery">` |
| Résumé entries | `<div class="exp-item">` blocks in the Experience section |
| Contact | the `<footer>` block |

Design language: near-white ground, near-black ink, hairline rules, and motion
limited to opacity fades and underline transitions. Nothing animates that would
slow down browsing.

## Deploying

Pushing to `main` triggers `.github/workflows/deploy.yml`, which runs
`wrangler deploy` and publishes to Cloudflare. Nothing else to do.

**First-time setup** — two repository secrets are required:

1. Create an API token at <https://dash.cloudflare.com/profile/api-tokens>
   using the **Edit Cloudflare Workers** template.
2. Find your Account ID on the Cloudflare dashboard overview page.
3. Add both under *Settings → Secrets and variables → Actions*:
   - `CLOUDFLARE_API_TOKEN`
   - `CLOUDFLARE_ACCOUNT_ID`

To deploy by hand instead:

```bash
npx wrangler deploy
```

## Local preview

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

No install required — it's a static file.
