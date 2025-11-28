# personal-site rilopez.com

This repository contains the code to generate my static personal site [rilopez.com]

## Setup

This project uses [mise](https://mise.jdx.dev/) for tool version management and task running.

### Install mise

Follow the [mise installation guide](https://mise.jdx.dev/getting-started.html) for your platform.

### Install Tools

```bash
# Install Hugo 0.147.7 and Node.js 20
mise install

# Verify installation
mise current
```

## Development

### Start Development Server

```bash
# Using mise (recommended)
mise run dev

# Or directly with Hugo
hugo server -D
```

The site will be available at http://localhost:1313

### Build the Site

```bash
# Using mise
mise run build

# Or directly with Hugo
hugo
```

The static files are built to the `docs/` directory.

## Creating Content

### Create a Blog Post

```bash
# Using mise
mise run new-post my-post-title

# Or directly with Hugo
hugo new posts/my-post-title.md
```

### Create a Book Review

```bash
# Using mise
mise run new-book book-name

# Or directly with Hugo
hugo new books/book-name.md
```

## Deployment

The site is deployed to GitHub Pages, serving from the `docs/` directory.

### Deploy to GitHub Pages

```bash
# Using mise (builds, commits, and pushes)
mise run deploy

# Deploy with custom commit message
mise run deploy-msg "your commit message"

# Or use the script directly
./scripts/commit_push_deploy.sh "your commit message"
```

For more info about GitHub Pages setup:
- https://gohugo.io/hosting-and-deployment/hosting-on-github/
- https://hackernoon.com/how-to-set-up-godaddy-domain-with-github-pages-a9300366c7b

## Maintenance

### Find Posts with Warning Tags

```bash
# Using mise
mise run find-warnings

# Or use the script directly
./scripts/find-warning-tags.sh
```

### List All Available Tasks

```bash
mise tasks
```

## Project Structure

- `content/posts/` - Blog posts
- `content/books/` - Book reviews
- `layouts/` - Custom Hugo templates (override theme defaults)
- `static/` - Static assets (CSS, images)
- `themes/coder/` - Hugo theme
- `docs/` - Built site (deployed to GitHub Pages)
- `scripts/` - Utility scripts

## Additional Documentation

See [CLAUDE.md](CLAUDE.md) for detailed guidance on:
- Writing style guidelines
- Content formatting conventions
- Frontmatter standards
- Custom layouts and theme customization

[rilopez.com]:https://rilopez.com
[Hugo]:https://gohugo.io/


