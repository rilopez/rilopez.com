--- 
date: 2021-05-04T22:47:55-05:00
title: "Svg Masks"
tags: ["TIL"]
---


Today after some pain learned how to create a mask to "carve" a hole with a given shape

```
<html>
<body style="background: url('https://64.media.tumblr.com/7bed8273f621486faecdd407969aef51/tumblr_otfcxeacdO1slhhf0o1_1280.jpg') center center / cover no-repeat;">
<svg className="text-demo" viewBox="0 0 600 400" width="600" height="400">
    <defs>
        <mask id="text-mask">
            <rect width="100%" height="100%" fill="white" />
            <text x="60" y="220" id="mySubtext" style="font-size: 150px; font-weight: bold;">
                A Mask
            </text>
        </mask>
    </defs>
    <ellipse cx="300" cy="200" rx="300" ry="150" fill="white" mask="url(#text-mask)" />
</svg>
</body>
</html>
```

![Text Mask Example ](/images/svg-mask-example.png#center)