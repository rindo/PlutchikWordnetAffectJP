# PlutchikWordnetAffectJP

### 概要

日本語版 [Wordnet Affect](http://wndomains.fbk.eu/wnaffect.html)を[プルチックの感情の輪](https://ja.wikipedia.org/wiki/%E6%84%9F%E6%83%85%E3%81%AE%E4%B8%80%E8%A6%A7)を元にした感情 + aに分類し直したものです。

### プログラム動作確認済環境

##### Mac OSX

macOS Sierra (10.12.5)

```
ruby -v
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
```

### 感情一覧

[こちら](https://en.wikipedia.org/wiki/Contrasting_and_categorization_of_emotions)を参考に感情は定義しています。

`Empty(無)` という感情を追加しています。 

|Name|Joy|Trust|Fear|Surprise|Sadness|Disgust|Anger|Anticipation|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Love(愛)|○|○|-|-|-|-|-|-|
|Guilt(罪悪感)|○|-|○|-|-|-|-|-|
|Delight(歓喜)|○|-|-|○|-|-|-|-|
|Morbidness(不健全な)|○|-|-|-|-|○|-|-|
|Pride(自尊心)|○|-|-|-|-|-|○|-|
|Optimism(楽観)|○|-|-|-|-|-|-|○|
|Submission(服従)|-|○|○|-|-|-|-|-|
|Curiosity(好奇心)|-|○|-|○|-|-|-|-|
|Sentimentality(感傷的)|-|○|-|-|○|-|-|-|
|Dominance(優越感)|-|○|-|-|-|-|○|-|
|Hope(希望)|-|○|-|-|-|-|-|○|
|Awe(畏れ)|-|-|○|○|-|-|-|-|
|Despair(絶望)|-|-|○|-|○|-|-|-|
|Shame(羞恥心)|-|-|○|-|-|○|-|-|
|Anxiety|-|-|○|-|-|-|-|○|
|Disapproval(失望)|-|-|-|○|○|-|-|-|
|Unbelief(不信感)|-|-|-|○|-|○|-|-|
|Outrage(激怒)|-|-|-|○|-|-|○|-|
|Remorse(自責の念)|-|-|-|-|○|○|-|-|
|Envy(嫉妬)|-|-|-|-|○|-|○|-|
|Pessimism(悲観)|-|-|-|-|○|-|-|○|
|Contempt(屈辱・軽蔑)|-|-|-|-|-|○|○|-|
|Cynicism(皮肉)|-|-|-|-|-|○|-|○|
|Aggressiveness(攻撃性)|-|-|-|-|-|-|○|○|
|Empty(無)|-|-|-|-|-|-|-|-|

### ファイル構成

```
.
├── README.md
├── dest
│   ├── ng.csv
│   └── ok.csv
├── resources
│   └── jpn-asynset.xml
├── word
│   ├── classifier.rb
│   ├── pos.rb
│   └── vocabulary
│       └── emotion.csv 
└── wordnet_classify.rb
```

* dest: プログラムで生成されるCSVが入る
* resources: wordnet関係のリソースが入る
* word: 分類のためのモジュール, データファイル群
* wordnet_cllasify.rb : wordnetを分類するプログラム

### Destに吐き出されるCSVの構成

##### ok.csv

`word/vocabulary` の各感情ファイルを元に分類された単語が入ります。

header : `emotion, word, pos, cat`

* emotion: プルチックの感情名
* word: 単語
* pos: 品詞 (verb, noun, adverb, adjective, unkown)
* cat: wordnet affect内のcategory

##### ng.csv

header : `cat, word, pos`

* cat: wordnet affect内のcategory
* word: 単語
* pos: 品詞 (verb, noun, adverb, adjective, unkown)


### 終わりに

またアップデートしていく予定なのでよろしくお願いします！
