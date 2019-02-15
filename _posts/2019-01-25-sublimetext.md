---
layout: post
title: "Sublime Text"
date: 2019-01-25 13:53:19 +0900
---

<!-- page_number: true -->

# Sublime Text 소개

크로스플랫폼에서 동작하는 아주 빠르고 좋은 에디터입니다.
한글입력시 매끄럽게 동작하지는 않습니다.

- [공식사이트](https://www.sublimetext.com/)
- [패키지 사이트](https://packagecontrol.io/)

---

## Package Controll 설치

---

### Sublime Text3 기준

`View > Show Console` 메뉴를 선택해서 console 상태에서 아래를 복사해서 붙여넣으면 됩니다.

```sh
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

---

## 유용한 Package

---

### Sync Settings

`Github`의 `gist`를 이용하여 `Sublime Text` 설정을 동기화 시켜주는 `Package` 입니다.

- [Github 페이지](https://github.com/mfuentesg/SyncSettings)

---

### AdvancedNewFile

빠르게 파일을 생성할수 있게 도와줍니다.

- [Github 페이지](https://github.com/skuroda/Sublime-AdvancedNewFile)

---

### IMESupport for Sublime Text

한글입력시 그나마 입력하는 모습이 보이도록 해줍니다.

- [Github 페이지](https://github.com/chikatoike/IMESupport)

---

### SFTP

FTP나 FTPS, SFTP에 연결하여 작업을 할수 있게 해줍니다.

- [Package Control 페이지](https://packagecontrol.io/packages/SFTP)

---