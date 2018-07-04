---
layout: post
title: "Node.js 9에 새로운 점"
date:   2017-11-14 11:00:00 +0900
---

Node.js 9에 새로운 점
====================

HTTP/2
------

--expose-http2 플래그가 필요없어졌습니다.
Node.js 8.4이후에서 HTTP/2를 사용하기 위해서는 플래그가 필요했었습니다. Node.js 9에서는 항상 사용할 수 있게되었습니다.

```js
const http2 = require('http2')
const fs = require('fs')
const server = http2.createSecureServer({
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('cert.pem')
})
server.on('error', (err) => console.error(err))
server.on('socketError', (err) => console.error(err))
server.on('stream', (stream, headers) => {
  // stream is a Duplex
  stream.respond({
    'content-type': 'text/html',
    ':status': 200
  })
  stream.end('<h1>Hello World</h1>')
})
server.listen(8443)
```

Deep Strict Equal
-----------------

util 모듈에 deep strict equal 포함됩니다.
이제부터는 util.isDeepStrictEqual (value1, value2) 메소드를 사용하여 모든 값을 비교할 수 있습니다.

```js
const { isDeepStrictEqual } = require('util')
const isEq = isDeepStrictEqual({
  a: '1'
}, {
  a: 1
})
```

util 모듈에 Callbackfy가 추가
---------------------------

util.promisify가 Node.js 8에 추가되었습니다. 그러나 호환성의 이유로 인해 반대의 필요성이 있었습니다

```js
const { callbackify } = require('util')
async function main () {
  await Promise.resolve()
}
callbackify(main)(function (err) {
  if (err) {
    return console.error(err)
  }
  console.log('finished without an error')
})
```

더 많은 static error codes
-------------------------

오류가 발생했을 때 문자열 비교 문제를 해결하기 위해 Node.js 코어에 정적 오류 코드가 표시되기 시작했습니다.

```js
if (err.message === 'Can\'t set headers after they are sent.') {
  //do something with the error
}
```

이 문제점은 심지어 오타 수정으로 인해 크게 변경 될 수 있다는 것입니다.

```js
if (err.code === 'ERR_HTTP_HEADERS_SENT') {
  //do something with the error
}
```

[에러코드 링크](https://nodejs.org/api/errors.html#errors_node_js_error_codes)

---

- [Node.js 9에 새로운 점](#nodejs-9%EC%97%90-%EC%83%88%EB%A1%9C%EC%9A%B4-%EC%A0%90)
  - [HTTP/2](#http2)
  - [Deep Strict Equal](#deep-strict-equal)
  - [util 모듈에 Callbackfy가 추가](#util-%EB%AA%A8%EB%93%88%EC%97%90-callbackfy%EA%B0%80-%EC%B6%94%EA%B0%80)
  - [더 많은 static error codes](#%EB%8D%94-%EB%A7%8E%EC%9D%80-static-error-codes)