--- 
date: 2021-08-01T21:43:14-05:00
title: "Git Bisect"
tags: ["TIL"]
---


Today I discovered a `git bisect` while reading the comments threads of this
[Hacker news post],  The command uses a binary search algorithm to find which commit in your project history introduced 
a bug.

Lets image that you discover a regression in your current branch state, and you want to know which commit introduce the culprit change




```sh
git bisect start  # initialize the algorithm

git bisect bad    # marks the current commit as buggy 
```

`git bisect` selects a commit in the middle of your range history, check it out and outs something like

```sh
Bisecting: 675 revisions left to test after this (roughly 10 steps)
```


then you compile & test your checked version and if the bug is not there mark the commit as good `git bisect good` otherwhise `git bisect bad`

Eventually there will be no more revisions left to inspect and the command will print out a description of the first bad commit  and the reference `refs/bisect/bad` will point a at that commit


[Hacker news post]: https://news.ycombinator.com/item?id=28024972