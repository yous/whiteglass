---
layout: post
title: "REST Client(vs code)"
---


REST Client (vs code)
================

**REST client**를 사용하면 HTTP 요청을 보내고 **vs code**에서 직접 응답을 볼 수 있습니다.

사이트: https://marketplace.visualstudio.com/items?itemName=humao.rest-client


사용
------

**vs code** 상에서 아래와 같이 간단히 입력하시면 됩니다.
```
https://example.com/comments/1
```


표준 **RFC 2616**에 따라서 request method, headers and body를 정의 할수 있습니다.

```
POST https://example.com/comments HTTP/1.1
content-type: application/json

{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}
```

request 선택
------------------

같은 파일에 많은 요청을 저장하고 원하는대로 쉽게 실행할 수 있습니다. **REST Client**는 세 개 이상의 연속 된 **#**으로 시작하는 모든 행을 요청 간의 구분 기호로 인식 할 수 있습니다.

```
GET https://example.com/comments/1 HTTP/1.1

###

GET https://example.com/topics/1 HTTP/1.1

###

POST https://example.com/comments HTTP/1.1
content-type: application/json

{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}
```


Request Line
------------------

선택 영역의 첫 번째 비어 있지 않은 행 (또는 아무것도 선택되지 않은 경우 문서)이  **Request Line**입니다.

```
GET https://example.com/comments/1 HTTP/1.1
```

```
GET https://example.com/comments/1
```

```
https://example.com/comments/1
```

**method** 가 생략되면 요청은 **GET**으로 처리됩니다.


Query Strings
-------------------

```
GET https://example.com/comments?page=2&pageSize=10
```

```
GET https://example.com/comments
    ?page=2
    &pageSize=10
```


Request Headers
------------------------

첫 번째 줄에 대한 **Request Line** 바로 뒤의 줄은 **Request Headers**로 사용됩니다.

```
User-Agent: rest-client
Accept-Language: en-GB,en-US;q=0.8,en;q=0.6,zh-CN;q=0.4
Content-Type: application/json
```


Request Body
-------------------

**Request Headers** 다음에 빈 줄을 추가하고 이후의 모든 내용은 **Request Body**로 처리됩니다.

```
POST https://example.com/comments HTTP/1.1
Content-Type: application/xml
Authorization: token xxx

<request>
    <name>sample</name>
    <time>Wed, 21 Oct 2015 18:27:50 GMT</time>
</request>
```

```
POST https://example.com/comments HTTP/1.1
Content-Type: application/xml
Authorization: token xxx

< C:\Users\Default\Desktop\demo.xml

```

```
POST https://example.com/comments HTTP/1.1
Content-Type: application/xml
Authorization: token xxx

< ./demo.xml
```

```
POST https://api.example.com/user/upload
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW

------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="text"

title
------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="image"; filename="1.png"
Content-Type: image/png

< ./1.png
------WebKitFormBoundary7MA4YWxkTrZu0gW--
```

---

[TOC]