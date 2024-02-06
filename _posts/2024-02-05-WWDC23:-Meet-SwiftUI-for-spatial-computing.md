---
layout: post
title:  "WWDC23: Meet SwiftUI for spatial computing"
date:   2024-02-05 00:01:16 +0900
categories: WWDC/WWDC23
---
# SwiftUI로 앱을 만들어야 하는 이유

이제 3D로 제작되는 새로운 기능들은 SwiftUI에서만 사용할 수 있다. 새로운 환경에서는 UIKit 기반이 아닌, SwiftUI 기반으로 만들어지기 때문에 SwiftUI로 코드를 설계해야 한다.

## 플랫폼 통합 컴포넌트

![](/images/2024-02-05-22-39-43.png)

iOS, MacOS, VisionOS 모두 하나의 코드 (Button)으로 각 플랫폼에 따라 최적의 모양으로 빚어준다.

VisionOS에서의 Button은 활기 있는 소재의 배경을 사용하며, 모든 버튼은 시선, 손 포인터 입력에 반응해서 Hover 효과를 준다. Scale을 조정하여 눌렸을 때 소리로 피드백을 주기도 한다.

![](/images/2024-02-05-22-44-15.png)

Label 요소를 사용하면 Hover 효과 시 이름도 표현 가능하다.

![](/images/2024-02-05-22-45-19.png)

![](/images/2024-02-05-22-45-38.png)

TabView에서도 바라보기만 하면 자동으로 Expand된다.

# Scene

새로운 API들은 SwiftUI로 제작되었고, 3D 맞춤형으로 제작되었다.

API는 Scene으로부터 시작된다.

![](/images/2024-02-05-22-55-04.png)

App은 Scene으로 구성되고, Scene은 View로 구성된다.\
WindowGroup은 하나 이상의 윈도우를 표현한다.

공간 컴퓨팅은 Window, Volume, Full Space으로 구성된다.

![](/images/2024-02-05-23-09-44.png)

* Window는 전통적이고 익숙한 인터페이스 구축할 때 사용.
* Volume는 가벼운 3D 경험을 선사할 때 사용. (FaceTime하면서 보드게임을 하거나 3D 모형을 보는 데 사용)
* Full Space는 영역을 전체 공간으로 확장하여 완전한 몰입감을 선사할 수 있음. (다른 윈도우는 숨겨짐)

# Window

![](/images/2024-02-05-23-15-08.png)

Window는 유리 배경에서 시작한다. 사람들이 주변 환경을 계속 볼 수 있도록하고, 콘텐츠의 가독성을 높인다.

![](/images/2024-02-05-23-16-44.png)

TabView, Navigation Stack, Split View, List, Button, Toggle, Picker 등등 모두 사용 가능하다.

## Ornament

> Ornament : 예술품 등을 장식으로 꾸미는 것 또는 그 물체.

![](/images/2024-02-05-23-20-03.png)

윈도우 바깥에 무언가를 두고 싶다면 Ornament를 사용하면 된다. TabView 등에는 미리 적용되어 있고, `.ornament` 모디파이어를 이용해서 직접 만들 수도 있다.

## Material

![](/images/2024-02-05-23-22-10.png)

material을 활용해서 라이브러리 탭이 잘 어울리도록 하고 가독성을 높여보는 작업을 해보자.

`.background` 모디파이어에 Material을 넣고, 코너를 둥글게 깎아봤더니?

![](/images/2024-02-05-23-23-17.png)

와우!

## `.secondary` 스타일

![](/images/2024-02-05-23-25-11.png)

Learn more 버튼이 조금 무거워 보인다고 한다.

이 Text에 `.secondary` 스타일을 적용해 보았더니,

![](/images/2024-02-05-23-26-21.png)

조금 더 가벼워진 것을 볼 수 있다.

* `.secondary`는 배경 material에 맞추어서 자동으로 vibrant (활기)를 적용하는 스타일이다. 부수적인 콘텐츠에 사용하면 된다.

## Interaction

![](/images/2024-02-05-23-30-27.png)

앱과 상호작용하는 수단으로는, 눈, 손, 포인터, 하드웨어 지원, Voice Over나 Switch Control 등이 있다.

![](/images/2024-02-05-23-32-53.png)

기존에 있던 gestures 뿐만 아니라 추가로 다음과 같은 API 들이 생겼다.
* RotateGesture3D : 두 손이나 연결된 트랙패드를 통해 3차원으로 회전시킬 수 있음.
* targetedToEntity, SpatialEventGesture, preferredHandAction, 3D properties on spatial gestures

![](/images/2024-02-05-23-35-18.png)

기존에 있던 다른 Accessibility 기능들도 그대로 사용할 수 있다.

## Hover Effect

![](/images/2024-02-05-23-36-27.png)

Hover effect는 보는 것 만으로도 시스템이 미묘한 강조 효과를 주어서 상호작용한다는 확신이 들게 하는 효과이다. 반응적인 피드백은 물론, 목표 선택을 돕는다. Hover effect는 사람들이 보고 있는 것에 반응할 수 있는 유일한 수단이다.

Hover effect는 개인 정보 보호를 위해 앱 프로세스 밖에서 동작하게 되며, 이미 있는 여러 control들에 기본적으로 적용되어있다.

커스텀 컨트롤이나 스타일을 적용할 때에는 꼭 hover 효과를 주어서 반응성과 쉬운 사용성을 느끼게 해야 한다.

![](/images/2024-02-05-23-40-51.png)

buttonStyle을 커스텀으로 적용해서 hover 효과가 나타나지 않는 상태이다.

버튼 스타일에 `.hoverEffect()`를 주게 된다면?

![](/images/2024-02-05-23-42-24.png)

hover 효과가 생기게 된다.

# Volume

![](/images/2024-02-05-23-43-47.png)

volume을 사용하려면, 해당 windowStyle을 `.volumetric`으로 주어야 한다.

![](/images/2024-02-05-23-46-23.png)

default로 사이즈를 줄 수도 있다.

![](/images/2024-02-05-23-46-53.png)

## RealityKit

RealityKit을 사용해서 3D 모델링된 지구본 모양을 갖고올 수 있다.

이미지와는 다르게 3D 콘텐츠는 로딩하는데 시간이 오래 걸리기 때문에 모두 비동기적으로 처리된다.\
AsyncImage 뷰와 동일하게 표시될 때 까지는 placeholder가 표시되고, 로딩이 완료되면 그 자리에 나타나게 된다.

## ZStack, padding, rotation

![](/images/2024-02-05-23-50-52.png)

ZStack을 통해 뷰를 겹치게 할 수 있다.

`.padding3D`를 통해 입체적으로 padding을 설정할 수 있다.

컨트롤러에 해당하는 부분은 `.glassBackgroundEffect`를 통해 material도 적용시킬 수 있다.

![](/images/2024-02-05-23-52-42.png)

`.rotation3DEffect`를 통해서 회전 효과를 줄 수 있고, `@State` 변수를 통해 상태를 부여할 수 있다.

![](/images/2024-02-05-23-58-09.png)

tap 제스처를 붙여서 spin시킬 수 있다.

## RealityView

그러나 아직 부족하다.. RealityView를 적용시켜보자.

![](/images/2024-02-05-23-59-52.png)

새로 나온 RealityView API를 통해 RealityKit의 모든 것을 사용할 수 있다.

![](/images/2024-02-06-00-01-20.png)

(사전에 제작해둔) `addImageBasedLighting()` 메소드를 통해 햇살이 비치는 효과를 줄 수 있다.

## Gesture & Attachment

![](/images/2024-02-06-00-03-56.png)

`SpatialTapGesture`를 통해 공간에서 탭한 좌표를 갖고올 수 있다.

![](/images/2024-02-06-00-13-51.png)

`attachments`를 사용하면 3D 모델에 개체를 혼합할 수 있다.

pin을 통해 탭한 좌표를 표시해줄 것이다.

![](/images/2024-02-06-00-15-50.png)

`update`에서 뷰가 업데이트될 때 어떤 작업을 하는지 알려준다.

코드에서는 pin을 추가한다.

![](/images/2024-02-06-00-17-38.png)

pin 된 화면이다.

# Full space

이 모드로 진입하면, 콘텐츠를 아무 곳에나 배치할 수 있다.

![](/images/2024-02-06-00-20-17.png)

먼저 ImmersiveSpace라는 새로운 Scene을 추가한다.

![](/images/2024-02-06-00-21-26.png)

이 Scene으로 진입하기 위해서는 `openImmersiveSpace` 의존성을 통해 해당 id를 띄워주면 된다.

![](/images/2024-02-06-00-22-19.png)

와우! 하지만 조금 더 몰입하고 싶다면? immersion style을 적용하면 된다.

## Immersion Style

![](/images/2024-02-06-00-23-48.png)

* 콘텐츠가 실제 세상과 공존하는 Mixed Immersion은 가벼운 경험에 잘 맞는다.
* Progressive (점진적) Immersion은 Digital Crown을 이용해서 몰입 정도를 조절할 수 있다.
* 완벽히 다른 세상처럼 느끼게 하는 Full Immersion은 주변 공간을 가리고 놀라운 세상!으로 이동시킨다.

여기서는 Full Immersion을 선택한다.

![](/images/2024-02-06-00-26-27.png)

ImmersiveSpace Scene에 `.immersionStyle` 모디파이러를 통해 해당 immersion이 `.full`이라는 것을 명시해준다.

![](/images/2024-02-06-00-28-14.png)

몰입 경험을 더 높이기 위해 starfield 요소를 추가한다.

![](/images/2024-02-06-00-28-42.png)

starfield 요소를 Earth, Sun과 함께 위치시킨다.

![](/images/2024-02-06-00-29-23.png)

이제 완전한 몰입이 가능해졌다. (영상 23:44)

![](/images/2024-02-06-00-30-30.png)

ARKit은 사람들의 실제 주변 환경을 실시간으로 파악할 수 있게 한다. 물리적인 표면에 콘텐츠를 배치시킬 수 있고, 커스텀으로 손 제스처 등을 추가할 수 있다.\
자세한 것은 Meet ARKit for spatial computing에..

![](/images/2024-02-06-00-32-45.png)

ARKit으로 이런 것도 가능하다고 한다.

###### Reference
https://developer.apple.com/videos/play/wwdc2023/10109
https://developer.apple.com/documentation/visionOS/World

