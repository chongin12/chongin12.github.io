---
layout: post
title:  "WWDC23: Design for spatial user interfaces"
date:   2024-02-18 20:02:47 +0900
categories: WWDC/WWDC23
---

[https://developer.apple.com/videos/play/wwdc2023/10076](https://developer.apple.com/videos/play/wwdc2023/10076)

# UI Foundation

## App Icons

three-dimensional app icon을 만들어보자.

![](/images/2024-02-18-20-05-35.png)

multiple layer를 사용해야 한다.

![](/images/2024-02-18-20-12-45.png)\
1024 픽셀 x 1024 픽셀로 이루어져 있다.

circular로 마스킹 하고 끝내면, 이제 시스템에서 그림자나 depth 설정 등을 자동으로 해준다.

## Material

사용자로 하여금 쉽게 배치하고, 쉽게 사용하고, 쉽게 볼 수 있는 소재. Glass Material이다.

![](/images/2024-02-18-20-16-29.png)

Glass Material을 사용해서 뒤 배경을 쉽게 인지할 수 있으며, 앱에 solid한 color 등 배경을 가리는 요소는 지양해야 한다.

![](/images/2024-02-18-20-18-53.png)

기본 배경에 조금 더 어두운 glass material을 넣고, 거기에 포인트를 주고 싶다면 다시 밝은 glass material을 넣도록 하자. 밝은 소재 위에 더 밝은 소재를 두는 행위는 하지 않아야 한다.

## Typography

![](/images/2024-02-18-20-20-59.png)

body와 title에 들어가는 타이포가 다른 플랫폼이랑 다르다.

Extra large title font 등이 새로 들어갔다.

일반적인 타이포보다 한 단계 더 bold하게 처리하면 될 것 같다.


## Vibrancy (활기)

가독성에 큰 영향을 끼친다.

![](/images/2024-02-18-20-24-40.png)

이게 Vibrancy Off한거

![](/images/2024-02-18-20-24-51.png)

이게 Vibrancy On한거. 확실히 차이가 난다.

![](/images/2024-02-18-20-24-21.png)

## Colors

![](/images/2024-02-18-20-25-44.png)

버튼의 역할을 색으로 확실하게 구분지어야 한다.


# Layout

## Ergonomics (인체 공학)

![](/images/2024-02-18-20-27-41.png)

좌우 탐색 범위가 상하 탐색 범위보다 크기 때문에 특정 요소를 너무 높거나 너무 낮게 배치해서는 안된다.

중요한 것은 중간에 배치해야 한다.

## Sizing

![](/images/2024-02-18-20-29-23.png)

Interaction을 위한 버튼 등은 최소 60pt 이상이어야 한다.

![](/images/2024-02-18-20-30-04.png)

주변 공간은 최소 8pt정도 여유가 있어야 한다.


## Focus feedback

![](/images/2024-02-18-20-31-51.png)

각 요소마다 hover effect를 제대로 보여주기 위해서는 4pt정도의 여유 공간이 꼭 필요하다.

![](/images/2024-02-18-20-33-11.png)

밖에 있는 corner radius와 안쪽에 있는 corner radius는 달라야 더 smooth하게 보여줄 수 있다. 코너 원의 중심을 맞추기 위해서 위와같은 공식에 대입하여 corner radius를 구하자.

# From Screen to Spatial

input들에 대해서 : System 컴포넌트를 쓰면 편하다.

## Window

Window는 Screen에서는 불투명한 배경으로, Spatial에서는 약간 투명한 배경으로 존재한다.

## Tab bar

![](/images/2024-02-18-20-38-22.png)

Screen에서는 왼쪽 윈도우 바깥에 뜨게 된다. 6개까지 사용하는것을 권장한다.

## Side bar

![](/images/2024-02-18-20-39-33.png)

Sidebar는 왼쪽에 ipad랑 똑같이 뜨게 된다.

## Ornaments

![](/images/2024-02-18-20-40-24.png)

위쪽에 있던 Years, Months, Days, All Photos를 주목해보자.

![](/images/2024-02-18-20-40-34.png)

이제 아래쪽, 살짝 앞쪽으로 나와있는 것을 볼 수 있다.

Tool bar같은것을 넣기에 제격이다.

![](/images/2024-02-18-20-41-21.png)

어차피 button들의 집합이기 때문에 각각 버튼 이펙트를 넣을 필요가 없다.

![](/images/2024-02-18-20-42-00.png)

Ornaments를 배치할 때는 기존 화면과 20pt정도 겹쳐서 배치하면 된다.

## Menus

![](/images/2024-02-18-20-44-32.png)

![](/images/2024-02-18-20-44-58.png)

## Popovers

![](/images/2024-02-18-20-44-50.png)

![](/images/2024-02-18-20-45-12.png)

## Sheets

![](/images/2024-02-18-20-45-42.png)

나올 때 뒤 배경이 살짝 들어간다.

![](/images/2024-02-18-20-46-39.png)

![](/images/2024-02-18-20-46-46.png)

꼭!! 왼쪽 위에 backbutton과 close button이 위치해야 한다.!!!