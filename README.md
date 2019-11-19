# nimgram
nim言語でn-gramを出します。

main.nimにサンプルを書いてます。  
ngram.nimが本体です。


# 使い方

```nim
import ngram

let sample1 = nGram("今日はいい天気", 2)
```

↓

```
今日
日は
はい
いい
い天
天気
```
