# BAD.AI

Marketing site and portfolio for **BAD.AI** — an AI consultancy. _BAD.AI_ is pronounced **badai**, Indonesian for **"storm"**, and the name comes from the founder's initials: **B**obby **A**nanta **D**ioriza.

🔗 Live: [bad.ai.id](https://bad.ai.id)

The site positions the consultancy ("AI that hits like a storm") and showcases live projects — RAG chatbots, LLM-powered OCR, and privacy-first tools built fast with AI agents.

## Tech

- **HTML + [Tailwind CSS](https://tailwindcss.com/)** (via Play CDN) — no build step.
- **[Alpine.js](https://alpinejs.dev/)** — mobile menu, and the data-driven portfolio grid + modal.
- **Fonts**: [Manrope](https://fonts.google.com/specimen/Manrope) (geometric sans) + [Space Mono](https://fonts.google.com/specimen/Space+Mono) (mono microcopy) via Google Fonts.
- **Hosting**: [Cloudflare](https://www.cloudflare.com/) (Workers static assets) — auto-deploys on push to `main`; security headers via `_headers`.

## Structure

| File | Purpose |
| --- | --- |
| `index.html` | Landing page — hero, services ("Three storms"), stack, featured work, contact. |
| `portfolio.html` | Project grid + click-to-expand modal. Data-driven and deep-linkable (`/portfolio#breaking`). |
| `portfolio/` | Project screenshots used by the cards/modals. |
| `favicon.svg` · `favicon.ico` · `favicon-32.png` · `apple-touch-icon.png` | Logo mark (black square, white **B**, orange dot). |
| `og.jpg` | 1200×630 social share card (Open Graph / WhatsApp / X). |
| `robots.txt` · `sitemap.xml` | SEO. |
| `wrangler.json` | Cloudflare Workers config — serves static assets from `./dist`. |
| `_headers` | Security headers (HSTS, X-Frame-Options, etc.) applied by Cloudflare. |
| `package.json` | `build` script copies the site files into `dist/`. |
| `vercel.json` · `middleware.js` | Legacy leftovers from an earlier host; not used by the Cloudflare build. |

## Adding a portfolio project

Portfolio content is a single `projects` array inside `portfolio.html`. Add one object:

```js
{
  id: 'myproject', index: '07', kind: 'rag chatbot', name: 'My Project',
  url: 'https://myproject.badai.tech/', domain: 'myproject.badai.tech',
  thumb: 'portfolio/myproject-home.png',
  blurb: 'One-line summary shown on the card.',
  tags: ['rag', 'privacy-first'],
  description: 'Full HTML description shown in the modal.',
  shotBg: '#0b0f0c',           // bg behind the screenshot
  features: []                 // optional [{label, title, img, body}]
}
```

Drop the screenshot in `portfolio/`. The card, modal, and `#id` deep link are generated automatically. For agent-built utilities, use `kind: 'built by agents'`.

## Local development

```bash
python -m http.server 8000
# → http://localhost:8000
```

> **Note:** clean URLs (`/`, `/portfolio`) are handled by Cloudflare. The local Python server doesn't strip `.html`, so during local preview open `index.html` and `portfolio.html` directly. Everything resolves correctly once deployed.

## Deployment

Hosted on Cloudflare. Auto-deploys on push to `main`: the `build` script in `package.json` copies the site into `dist/`, and `wrangler.json` serves `dist/` as static assets. Security headers come from `_headers`.

## Credits

Designed & built by [Bobby Ananta Dioriza](https://bobby.dioriza.com).
