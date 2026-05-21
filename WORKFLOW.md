# Wexamour Chronicle — Development Workflow

A two-stage process: preview everything locally first, then push to GitHub to go live.

---

## Stage 1 — One-Time Setup

### 1. Install Hugo (if you haven't already)

The site uses **Hugo Extended** (required for the CSS pipeline).

```bash
# macOS via Homebrew (recommended)
brew install hugo

# Verify it installed correctly
hugo version
# Should print: hugo v0.128.0+extended ...
```

### 2. Initialize the Git repository

From inside the `wexamourchronicle/` folder:

```bash
git init
git add .
git commit -m "Initial commit — The Wexamour Chronicle"
```

### 3. Create a GitHub repository

- Go to [github.com/new](https://github.com/new)
- Name it `wexamourchronicle` (or `wexamourchronicle.com`)
- Set it to **Public** (required for free GitHub Pages)
- Do **not** initialize with a README — you already have files

Then connect your local repo to GitHub:

```bash
git remote add origin https://github.com/YOUR-USERNAME/wexamourchronicle.git
git branch -M main
git push -u origin main
```

### 4. Enable GitHub Pages

- Go to your repo on GitHub → **Settings** → **Pages**
- Under **Source**, select **GitHub Actions**
- Save. The deploy workflow is already in `.github/workflows/deploy.yml` —
  it will run automatically on every push to `main`.

### 5. Add your custom domain (optional, do this last)

- In repo Settings → Pages → Custom domain, enter `wexamourchronicle.com`
- In your domain registrar's DNS settings, add:

| Type  | Host | Value                  |
|-------|------|------------------------|
| A     | @    | 185.199.108.153        |
| A     | @    | 185.199.109.153        |
| A     | @    | 185.199.110.153        |
| A     | @    | 185.199.111.153        |
| CNAME | www  | YOUR-USERNAME.github.io |

DNS can take a few hours to propagate. GitHub will automatically provision HTTPS once it resolves.

---

## Stage 2 — Daily Workflow (Local → Live)

### Step 1 · Start local preview

```bash
cd wexamourchronicle
make serve
```

Open [http://localhost:1313](http://localhost:1313) in your browser.
Hugo watches for changes and live-reloads the page automatically.
Draft articles (those with `draft: true` in their front matter) are visible locally but won't publish to GitHub.

### Step 2 · Write or edit an article

To create a new article:

```bash
make new NAME=my-article-slug
```

This creates `content/dispatches/my-article-slug.md` pre-populated with front matter.
Open it in any text editor and fill in the content.

The front matter fields you'll use most:

```yaml
---
title: "Your Article Title"
subtitle: "An optional italic subheadline"
date: 2026-05-13
author: "Chronicle Staff"
section_label: "Dispatches"
draft: false          # set to true to hide from the live site
summary: "This appears on the homepage and in article lists."
---

Your article body goes here in Markdown...
```

### Step 3 · Verify locally

Check the article at `http://localhost:1313/dispatches/my-article-slug/`
and the homepage at `http://localhost:1313` to make sure layout and formatting look right.

### Step 4 · Build a production preview (optional sanity check)

```bash
make build
```

This generates the full site in the `/public` folder — no drafts, fully minified.
You can open `public/index.html` directly in a browser for a final check.

### Step 5 · Push to GitHub and go live

```bash
git add .
git commit -m "Add article: Your Article Title"
git push
```

The GitHub Actions workflow in `.github/workflows/deploy.yml` kicks off automatically.
You can watch it run in real time under your repo's **Actions** tab.
The site is live within ~1–2 minutes of the push.

### Step 6 · Verify the live site

Visit `https://wexamourchronicle.com` (or your GitHub Pages URL before the domain is set up).
If something looks wrong, make the fix locally, verify it at localhost, and push again.

---

## Quick Reference

| Command       | What it does                                      |
|---------------|---------------------------------------------------|
| `make serve`  | Local preview at localhost:1313, with live reload |
| `make build`  | Production build into `/public`                   |
| `make clean`  | Delete `/public` folder                           |
| `make new NAME=slug` | New article at `content/dispatches/slug.md` |
| `git push`    | Triggers automatic deploy to GitHub Pages         |
