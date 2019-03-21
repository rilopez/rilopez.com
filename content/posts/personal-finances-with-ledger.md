--- 
draft: true 
date: 2019-03-09T16:46:06Z 
title: "Personal Finances With Ledger" 
tags: [cli] 
---


Where my money went this time?  That is always my question  every time I take a look to my monthly
bank statements. Over the years I have tried several apps and methods to reduce the panic we get when
we have no idea how we  acquired that credit card debt, Although  all the options  have its  pros &
cons, commonly they share the same problem of locking your data to their chooses proprietary
format, giving you the risk of not being able to read   when the online service disappears or the
app no longer run on newer OS or devises.  [plain text accounting](https://plaintextaccounting.org)
uses simple text files with a human readable format to store your data, for sure it will win the
test of time.


The  [blog post baking with emacs](https://bofh.org.uk/2019/02/25/baking-with-emacs/) motivated me
to give plain text accounting a try. In general It felt awesome but complicated, until I got into
how he handled financial book-keeping. He was using an emacs/org-mode "pluging" for [ledger]


## My setup

After I run the normal brew dance to install it 

```bash

brew install ledger

```

I added some handy stuff to my dotfiles


```
alias l.go="cd ~/dev/repos/ledger"
alias l.edit="vim ~/dev/repos/ledger/main.ledger"
alias l.watch="l.go && watch -n 1 ledger bal Assets Liabilities"
alias l.save="l.go && scripts/commit_and_push.sh"
```
