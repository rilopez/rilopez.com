--- 
date: 2021-05-07T09:31:15-05:00
title: "Log Outgoing Node Http Requests"
tags: ["TIL"]
---


This morning I had to debug a node proxy and needed to verify the external service request 

```javascript
function requestLogger(httpModule){
    var original = httpModule.request
    httpModule.request = function(options, callback){
      console.log(options.href||options.proto+"://"+options.host+options.path, options.method)
      return original(options, callback)
    }
}

requestLogger(require('http'))
```

source: [stackoverflow](https://stackoverflow.com/questions/12964517/how-to-log-outgoing-https-requests-from-node-within-webstorm)
