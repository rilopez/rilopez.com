# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Isaac Lopez's personal website (rilopez.com) built with Hugo static site generator. The site contains blog posts, book reviews, and personal information.

## Essential Commands

### Development
```bash
# Start local development server with drafts
hugo server -D

# Build the site (outputs to docs/ directory)
hugo
```

### Content Creation
```bash
# Create a new blog post
hugo new posts/post-title.md

# Create a new book review
hugo new books/book-name.md
```

### Deployment
```bash
# Deploy to GitHub Pages (builds, commits, and pushes)
./scripts/commit_push_deploy.sh

# Deploy with custom commit message
./scripts/commit_push_deploy.sh "your commit message"
```

## Architecture & Key Details

### Site Structure
- **Static Site Generator**: Hugo with "coder" theme
- **Hosting**: GitHub Pages serving from `/docs` directory
- **Build Output**: `publishDir = "docs"` in config.toml
- **Base URL**: https://rilopez.com/

### Content Types
1. **Posts** (`content/posts/`): Blog articles with standard frontmatter
2. **Books** (`content/books/`): Book reviews with custom layout including:
   - Author taxonomy
   - Rating system (via partials/rating.html)
   - ISBN field
   - Custom single.html template

### Custom Layouts
- Book reviews use custom templates in `layouts/books/` and `layouts/partials/`:
  - `book.html`: Main book template
  - `authors.html`: Author display
  - `rating.html`: Rating display
  - `tags.html`: Tag display

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
- Using "coder" theme with custom CSS in `static/css/main.css`
- Custom book review layouts extend the base theme

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
```yaml
date: YYYY-MM-DDTHH:MM:SSZ
title: "Title in Quotes"
tags: ["tag1", "tag2", "tag3"]
draft: false
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