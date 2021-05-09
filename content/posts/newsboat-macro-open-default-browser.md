--- 
date: 2021-05-09T00:16:18-05:00
title: "Newsboat Macro Open Default Browser"
tags: ["TIL"]
---

My [newsboat] is configured to use [w3m] (a textonly browser) as default browser

```
browser "w3m %u" 
```

from times to times you enconter some pages that does not look good on text-only browser
, this config defines a macro to open the default browser by pressing `,m`   (COMMA + lowercase m)

```
macro m set browser "xdg-open %u"; open-in-browser ; set browser "w3m %u"
```



[newsboat]: https://newsboat.org/
[w3m]: http://w3m.sourceforge.net/
