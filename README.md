# FlutterGeminiAI

## 一 项目说明

* 本项目基于`gemini-1.5-flash`多态模型
* 使用本项目前，请先申请Gemini API密钥
* 由于法律条款限制，国内用户可能无法使用此项功能。具体查看[Google AI Studio 和 Gemini API 的适用区域](https://ai.google.dev/gemini-api/docs/available-regions?hl=zh-cn)

## 二 功能开发

1-已开发

* 根据文本输入生成文本
* 根据文本和图片输入生成文本（多模态）

2-未开发

* 语音输入
* 视频输入及生成文本

## 三 价格

![][0]

## 四  项目预览

| ![][1] | ![][2] | ![][3] |
| ------ | ------ | ------ |
| ![][4] | ![][5] | ![][6] |
| ![][7] | ![][8] | ![][9] |

## 五 项目开发流程

### 5.1 api-key

1. 获取API密钥
2. 根据api_key初始化gemini模型(开发阶段直接设置，发布阶段传值)
3. 渲染模型，[Gemini变体](https://ai.google.dev/gemini-api/docs/models/gemini?hl=zh-cn)

说明：

1-传值(将$GOOGLE_API_KEY替换为apk_key)

```
flutter run --dart-define=API_KEY=$GOOGLE_API_KEY
```

2-初始化

```
final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
```

### 5.2 根据输入生成内容

1-根据文本输入生成文本

```
final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
final content = [Content.text('Write a story about a magic backpack.')];
final response = await model.generateContent(content);
print(response.text);
```

2-根据文本和图片输入生成文本（多模态）

```
final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
final (firstImage, secondImage) = await (
    File('image0.jpg').readAsBytes(),
    File('image1.jpg').readAsBytes()
  ).wait;
final prompt = TextPart("What's different between these pictures?");
final imageParts = [
    DataPart('image/jpeg', firstImage),
    DataPart('image/jpeg', secondImage),
  ];
final response = await model.generateContent([
    Content.multi([prompt, ...imageParts])
  ]);
print(response.text);
```

### 5.3 将内容添加到列表

* 左边显示Gemini消息，右边显示用户消息
* 增加判断条件(如isUser)，依次渲染消息发送方和接收方

## 六 依赖库

* [google_generative_ai ](https://pub-web.flutter-io.cn/packages/google_generative_ai)
* [image_picker](https://pub-web.flutter-io.cn/packages/image_picker)




[0]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/gemini-price.png
[1]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-start-1.png
[2]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-text-request-2.png
[3]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-text-response-3.png
[4]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-img-send-4.png
[5]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-img-response-5.png
[6]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-img-rec-6.png
[7]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-img-rec-result-7.png
[8]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-chat-list-8.png
[9]:https://cdn.jsdelivr.net/gh/PGzxc/CDN/blog-resume/flutter-gemini-chat-list-9.png