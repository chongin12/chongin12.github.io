---
layout: post
title:  "WWDC19: Introducing the Create ML App"
date:   2024-01-22 23:05:18 +0900
categories: WWDC/WWDC19
---
[https://developer.apple.com/videos/play/wwdc2019/430/](https://developer.apple.com/videos/play/wwdc2019/430/)

# Create ML App
![](/images/2024-01-22-23-07-39.png)

input, training, output 3단계로 이루어져있다.  
각 단계에서는 진척도, 정확도 등 여러 지표를 확인할 수 있다.  

# 사용해보기
![](/images/2024-01-22-23-12-51.png)  
XCode에서 Open Developers Tool > Create ML을 선택한다.  
  
![](/images/2024-01-22-23-19-55.png)  
많은 템플릿들이 있지만 그 중 Image Classification을 선택한다.  
  
![](/images/2024-01-22-23-38-00.png)  
위와 같이 생겼다.  
  
  
이제 학습을 시켜야 하는데, 데이터는 https://developer.apple.com/documentation/vision/classifying_images_with_vision_and_core_ml 여기에서 다운받았다. (WWDC 세션이랑 같지는 않다.)
  
  
![](/images/2024-01-22-23-38-39.png)  
Dataset 폴더를 Training Data에 넣었더니, 위와 같이 7개의 classes, 95개의 Items가 나왔다.
  

![](/images/2024-01-22-23-45-44.png)  
왼쪽 위 train 버튼을 통해 training을 시킬 수 있다.  
  
![](/images/2024-01-22-23-46-19.png)  
training이 완료 되었다.

![](/images/2024-01-22-23-51-50.png)  
신기하게 라이브로 프리뷰가 된다. Jasmine이 잘 인식된다.

![](/images/2024-01-22-23-52-22.png)  
Output 쪽으로 가보면 모델을 Get 할 수 있다.  

Get 한 모델을 XCode 등에서 바로 CoreML을 통해 사용할 수 있다.  


# Create ML의 도메인
## Image
### Image Classifier
Image 카테고리화 할 때 사용한다.  
Training할 때 Augmentation 옵션을 사용해서 각각의 사진을 복제해서 noise, blur 등을 적용시킨 후 같이 train 시킬 수 있다.  

![](/images/2024-01-22-23-59-33.png)  

### Object Detector
하나의 사진에서 다양한 물체를 식별할 때 사용하며, 딥 러닝 기반이다.  

![](/images/2024-01-23-00-02-49.png)  

## Sound Classifier
시간으로 식별할 수 있는 데이터에서 음성이 어떠한 것을 나타내는지 분류해준다.  
매우 빠르게 동작하며, 어떠한 기기에서도 real-time을 지원한다.  

![](/images/2024-01-23-00-05-07.png)  

## Activity Classifier
시간으로 식별할 수 있는 데이터에서 motion을 인식하여 어떠한 활동을 하고 있는지 분류해주는 모델이다.  
Accelerometer, Gyroscope 등 센서를 이용할 수 있다.  
딥러닝 기반이며, model size가 굉장히 작다.  

![](/images/2024-01-23-00-06-58.png)  

## Text
### Text Classifier
해당 문장, 문단, 글이 무엇을 나타내고 있는지 분류하는 모델이다.  
![](/images/2024-01-23-00-10-10.png)  



### Word Tagger
해당 문장, 문단, 글에서 주요 토큰을 매칭시키는 모델이다.  
![](/images/2024-01-23-00-12-00.png)  
예시로, 치즈를 설명하고 있는 문단에서 특징을 뽑아낼 수 있다. (이 치즈는 Sweet, Creamy, Acidic 하다.)

## Tabular Data
tabular data는 표 형식의 데이터를 의미한다.  
가장 general 하게 사용할 수 있다.  

### Tabular Classifier
다수의 인자들을 통해 특성을 분류하는 모델이다.  
![](/images/2024-01-23-00-13-10.png)  
예시로, 비행기의 해당 자리가 주어진 사람의 정보 (키, 몸무게 등)를 기반으로 편한지, 불편한지 알려주는 모델이다.  

### Tabular Regressor
주어진 값을 기준으로 파라미터의 값을 정하는 모델이다.  
![](/images/2024-01-23-00-19-28.png)  


### Recommender
주어진 값을 기준으로 추천해주는 모델이다.  
![](/images/2024-01-23-00-20-13.png)  
