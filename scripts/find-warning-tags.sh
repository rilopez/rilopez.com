#!/usr/bin/env bash
set -euo pipefail

# Script to find and group blog posts by warning-prefixed tags (#⚠️)

echo "=== Finding posts with warning tags (#⚠️) ==="
echo

# Directory containing posts
POSTS_DIR="content/posts"

# Temporary file to store results
TEMP_FILE=$(mktemp)

# Find all markdown files and extract warning tags
find "$POSTS_DIR" -name "*.md" -type f | while read -r file; do
    # Extract tags from frontmatter
    # Look for tags between --- markers and extract array content
    awk '
    /^---$/ { if (++count == 2) exit }
    count == 1 && /^tags:/ {
        # Found tags line, now process the array
        getline
        while ($0 !~ /^[a-zA-Z_-]+:/ && $0 !~ /^---$/) {
            # Remove array brackets, quotes, and split by comma
            gsub(/[\[\]"]/, "")
            gsub(/^[ \t]+/, "")
            if ($0 != "") {
                split($0, tags, ",")
                for (i in tags) {
                    gsub(/^[ \t]+|[ \t]+$/, "", tags[i])
                    # Check if tag starts with #⚠️
                    if (tags[i] ~ /^#⚠️/) {
                        print FILENAME "|" tags[i]
                    }
                }
            }
            if (getline <= 0) break
        }
    }
    ' FILENAME="$file" "$file" >> "$TEMP_FILE"
done

# Check if any warning tags were found
if [ ! -s "$TEMP_FILE" ]; then
    echo "No posts found with warning tags (#⚠️)"
    rm "$TEMP_FILE"
    exit 0
fi

echo "=== Summary of Warning Tags ==="
echo

# Extract unique warning tags and count
echo "Warning tags found:"
cut -d'|' -f2 "$TEMP_FILE" | sort | uniq -c | sort -rn | while read count tag; do
    echo "  $tag (used in $count posts)"
done

echo
echo "=== Files Grouped by Warning Tag ==="
echo

# Group files by tag
cut -d'|' -f2 "$TEMP_FILE" | sort | uniq | while read -r tag; do
    echo "Tag: $tag"
    echo "Files:"
    grep "|${tag}$" "$TEMP_FILE" | cut -d'|' -f1 | while read -r file; do
        # Extract just the filename without path
        basename "$file"
    done | sort | sed 's/^/  - /'
    echo
done

# Cleanup
rm "$TEMP_FILE"

echo "=== Report Complete ==="