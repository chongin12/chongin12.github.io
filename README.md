# chongin.github.io
aka [mosu.blog](https://mosu.blog)

# 카테고리 목록
- WWDC
    - WWDC19
    - WWDC20
    - WWDC21

# Makefile 사용법
terminal에 다음과 같이 입력 : 
```shell
$ make post title="테스트1"
```
그렇다면, _posts 폴더에 마크다운 파일이 생성.  
파일 이름 예시 : `2024-01-22-테스트1.md`  
파일 내용 예시 : 
```
---
layout: post
title:  "테스트1"
date:   2024-01-22 22:17:06 +0900
categories:
---
```

# Image Paste 사용법
vscode extension `Paste Image` 설치 후 확장 설정에 다음을 적용
```json
"pasteImage.basePath": "${projectRoot}",
"pasteImage.path": "${projectRoot}/images",
"pasteImage.prefix": "/"
```
이후 스크린샷 등 사진을 vscode 마크다운 에디터에 `Cmd+Option+V` 하면 images 폴더 안에 사진이 생성되며, 바로 import 된다.

# Local Test
`bundle install` 명령어로 gem 의존성 설치

`bundle exec jekyll serve` 명령어로 로컬 실행

`Server address: http://127.0.0.1:4000` 행을 확인하고 해당 주소 실행.