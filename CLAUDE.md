# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Isaac Lopez's personal website (rilopez.com) built with Hugo static site generator. The site contains blog posts, book reviews, and personal information.

## Essential Commands

### Tool Setup
This project uses [mise](https://mise.jdx.dev/) for version management and task running.

```bash
# Install required tools (Hugo 0.147.7, Node.js 20)
mise install

# List available tasks
mise tasks

# Tools are auto-activated if you have mise configured in your shell
# Otherwise, prefix commands with: mise exec --
```

Configuration is in [.mise.toml](.mise.toml). Custom tasks are defined in [.mise/tasks/](.mise/tasks/).

### Development
```bash
# Start local development server with drafts
mise run dev
# Or: hugo server -D

# Build the site (outputs to docs/ directory)
mise run build
# Or: hugo
```

### Content Creation
```bash
# Create a new blog post
mise run new-post post-title
# Or: hugo new posts/post-title.md

# Create a new book review
mise run new-book book-name
# Or: hugo new books/book-name.md
```

### Deployment
```bash
# Deploy to GitHub Pages (builds, commits, and pushes)
mise run deploy
# Or: ./scripts/commit_push_deploy.sh

# Deploy with custom commit message
mise run deploy-msg "your commit message"
# Or: ./scripts/commit_push_deploy.sh "your commit message"
```

### Maintenance
```bash
# Find posts with warning-prefixed tags (#⚠️)
mise run find-warnings
# Or: ./scripts/find-warning-tags.sh
```

## Architecture & Key Details

### Site Structure
- **Static Site Generator**: Hugo with "coder" theme
- **Hosting**: GitHub Pages serving from `/docs` directory
- **Build Output**: `publishDir = "docs"` in config.toml
- **Base URL**: https://rilopez.com/

### Content Types
1. **Posts** (`content/posts/`): Blog articles with standard frontmatter
   - Date, title, tags, draft status
   - Support for Hugo shortcodes (e.g., `{{< ref >}}` for internal links)
2. **Books** (`content/books/`): Book reviews with custom layout including:
   - Author field (string, not taxonomy array)
   - Rating system (via `layouts/partials/rating.html`)
   - Optional ISBN field
   - Uses `layouts/books/single.html` → `layouts/partials/book.html`
   - Displays "Date Read" instead of publication date

### Custom Layouts
- **Override Hierarchy**: Custom layouts in `layouts/` override theme templates from `themes/coder/`
- Book reviews use custom templates in `layouts/books/` and `layouts/partials/`:
  - `single.html`: Defines book page structure, delegates to `book.html` partial
  - `book.html`: Main book content template with author, date read, and rating
  - `authors.html`: Author display partial
  - `rating.html`: Rating display partial
  - `tags.html`: Tag display partial
- Posts use `layouts/partials/post.html` for custom formatting

### Taxonomies
- **authors**: Used primarily for book reviews
- **tags**: Used across posts and books
- **categories**: General categorization

### Deployment Flow
1. Hugo builds static files to `/docs` directory
2. Git commits include both source and built files
3. Push to master branch triggers GitHub Pages deployment
4. CNAME file in `/docs` configures custom domain

### Theme Customization
- Using "coder" theme (located in `themes/coder/`)
- Custom CSS in `static/css/main.css` (referenced in config.toml)
- Custom layouts in `layouts/` override theme defaults
- Site configuration: [config.toml](config.toml) includes theme params, menu structure, and social links

## Writing Style Guidelines

### Voice and Tone
- **Conversational and Personal**: Write as if speaking directly to the reader
- **Professional but Approachable**: Explain technical topics in accessible language
- **Reflective**: Include lessons learned and personal insights
- **Authentic**: Maintain personality over polish; occasional informal expressions are welcome

### Content Structure
1. **Hook Opening**: Start with a question, personal anecdote, or engaging statement
2. **Context**: Brief explanation of why the topic matters
3. **Main Content**: Organize with clear headings (## and ###) and lists
4. **Practical Examples**: Include code snippets, quotes, or real-world applications
5. **Concise Conclusion**: Brief wrap-up, often with philosophical reflection

### Formatting Conventions
- Use numbered lists for step-by-step processes
- Use bullet points for features, characteristics, or quick lists
- Include code blocks with proper syntax highlighting
- Use blockquotes prominently for important quotes and concepts
- Bold text sparingly for key terms and emphasis
- External links for tools, resources, and additional reading

### Content Categories
- **Technical Tutorials**: Step-by-step guides with practical focus
- **Philosophical Reflections**: Quote-heavy posts on life principles
- **Professional Insights**: Lessons learned from career experiences
- **Book-Inspired Posts**: Content derived from or inspired by books
- **TIL Posts**: Short posts about specific discoveries or techniques

### Frontmatter Standards

**Posts:**
```yaml
date: YYYY-MM-DDTHH:MM:SSZ
title: "Title in Quotes"
tags: ["tag1", "tag2", "tag3"]
draft: false
```

**Books:**
```yaml
title: "Book Title"
date: YYYY-MM-DDTHH:MM:SSZ  # Date read
author: "Author Name"       # String, not array
tags: [tag1, tag2]
rating: 4                   # Optional numeric rating
isbn: "1234567890"          # Optional
```

### Tag Categories
- **Technical**: programming, git, cli, web-development, devops
- **Learning**: learning, education, expertise, til
- **Philosophy**: stoicism, inspirational, psychology
- **Professional**: leadership, mentoring, talks, interview

### Writing Characteristics
- Integrate philosophical elements naturally (especially Stoic philosophy)
- Frame technical topics as learning experiences
- Provide context ("why") before diving into implementation ("how")
- Include book references and link to book review pages when relevant
- Balance theory with actionable advice
- Maintain focus on continuous learning and practical wisdom

## Commit Message Guidelines
- When writing commit messages do not include a line saying that it was written or co-authored by Claude