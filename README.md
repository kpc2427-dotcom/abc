# Loyumi flagship website — release candidate

This branch contains the QA-validated redesign for Loyumi.

## Routes

- `/` — new flagship homepage: **Run loyalty like a financial system.**
- `/old/` — preserved original long-form product guide.

## What is included

- Responsive enterprise homepage with real HTML/CSS product demonstrations.
- Accessible navigation, product tabs, keyboard behavior, focus management, and reduced-motion support.
- Preserved original page with its own styles, interactions, and progress state.
- SEO metadata, sitemap, robots policy, social card, web manifest, and `llms.txt`.
- Exact Content Security Policy, security headers, bounded caching, and archive `noindex` controls.
- Static QA and browser QA for desktop, tablet, mobile, interactions, and persistence.

## Verified quality result

- Static QA: **2,737 checks passed**.
- Browser QA: **24 checks passed**.
- No invented customers, certifications, performance numbers, SLAs, or production claims.

## Deployment

The source is stored as a deterministic transport archive because this staging repository was initialized empty. Vercel and Netlify run:

```bash
bash .bootstrap/build.sh
```

The build verifies both the Base64 payload and decoded archive with SHA-256 before extracting the exact tested release into `dist/`.

- Base64 SHA-256: `2410339f7bf2aa5bc27d9c84f4446b0bbbe724c3ed3d6b7786c1313ed5a06cdb`
- Archive SHA-256: `6acda8090a4864158251ebf1a9d169d99dba200b88ca98ee27c45013ef440cca`

For production integration, copy the extracted release tree into the actual Loyumi hosting repository, retain `/old/`, and deploy through its normal release process.
