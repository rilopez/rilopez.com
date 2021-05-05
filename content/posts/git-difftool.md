--- 
date: 2021-05-05T12:15:11-05:00
title: "Git Difftool"
tags: ["TIL", "git"]
---

I am so used to work with jetbrain tools that I seldom  use `git diff` and almost never configure and special diff tool. 
Today I learned how to setup [meld] as diff tool,  


I added this settings to my `~/.gitconfig`
```ini
[diff]
    tool = meld
[difftool]
    prompt = false
[difftool "meld"]
    cmd = meld "$LOCAL" "$REMOTE"
```

You can change the order of the diff panes by changing the meld command arguments

```ini
[difftool "meld"]
cmd = meld "$REMOTE" "$LOCAL"  # remote changes will appear in the right pane, local in the left
```



[meld]:https://meldmerge.org/