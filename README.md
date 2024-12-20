# Stapler-mini
![Icon_v0](https://github.com/user-attachments/assets/bc777a42-1dfd-4523-a1f5-65d78c96cdea)

## どんなアプリ？
**Stapler-mini**は[Karabiner-Elements](https://karabiner-elements.pqrs.org/)で使えるjsonファイルを出力するmacOSアプリケーションです。
いわゆる自作キーボードにおける、レイヤー機能・タップホールド機能を、ドラッグ&ドロップで直感的にカスタマイズすることができます。

### レイヤー機能って？
レイヤー機能とはあるキーを押しながら他のキー（例えばAとか）を押した時、他のレイヤーで設定しておいたキー(例えばスクショ⌘⇧3)を出力できるようになるような機能です。シフトキーを押しながら数字キーを押した時には数字ではなく記号が入力されますが、その入力される文字を自分で決められるというイメージです。
stapler-mini-v0では8枚のレイヤーを設定することができます。

### タップホールド機能って？
タップホールド機能とはキーを単打したときと長押ししたときで入力される文字を打ち分ける機能です。
例えばシフトキーやその他の修飾キーは単打をしてもキーのDownUpのみが入力されて実用上では全く意味のない入力ですが、そこに好きなショートカットを入れたりすることが可能なわけです。
反対にescapeやエンターは単打のような使い方しかしないキーなので、それらの長押しに好きな修飾キーのコンビネーションを入れたりもできます。

## 使い方

### 0.Karabiner-Elementsをダウンロードしておく
[Karabiner-Elements](https://karabiner-elements.pqrs.org/)からダウンロードして、立ち上げて案内の通りに権限を与えます。SimpleModificationで試しに何か書き換えられたら準備完了です。

### 1.本アプリをダウンロードする
<img width="1107" alt="ss 2024-10-29 22 31 49" src="https://github.com/user-attachments/assets/f563d00b-76de-4307-824a-e3279c20f78d">
<img width="1176" alt="ss 2024-10-28 2 55 34" src="https://github.com/user-attachments/assets/f0527e06-c41b-45db-b542-0ecf5d4d21fb">

### 2.アプリを立ち上げたらPresetを追加する
とりあえず公開版ではMacBookの本体キーボードのレイアウト3種類(US ,UK, JIS)から選ぶことができます。
最初に入っているVendorIDとProductIDは僕の環境でのMacBookの本体キーボードのIDなので、型番や環境によっては異なる場合があります。Karabiner-Elements側でIDを確認してその値を入力することでそのデバイスの書き換え用のファイルが出力できるようになります。もしくは書き出しした後に一括で編集してください。

注意：環境によっては本体キーボードのVendorIDやProductIDがkarabiner側やシステム情報にも表示されないことがあるようです。その場合はLocationIDで条件付け(デバイスの固定値ではないけど本体キーボードなら多分変わらない)でうまくいっているようですが、何か詳しいことがわかる人がいたらDiscordサーバーで知恵を貸してください！
```
"conditions": [
  {
    "type": "device_if",
    "identifiers": [
      {
        "is_built_in_keyboard": true
      }
    ]
  }
]
```
本体キーボード限定の書き換えならこっちの方が良いかも。


### 3.キーをドラッグ&ドロップして好きなようにカスタマイズする
基本は下側のカスタマイズキーを上部のキーボードビューの任意のキーにドラッグ&ドロップしてカスタマイズを行います。
<img width="1007" alt="ss 2024-10-27 20 33 15" src="https://github.com/user-attachments/assets/21aa7baa-876c-4b1c-b10b-593fd0fd6ca4">

また外部キーボードはVendorIDとProductIDをテキストフィールドに入力することでカスタマイズが可能です。
本体キーボードともともとのキーコードが一部異なるキーボードを使っている場合、そのキーの書き換えはそのままだとうまくいきません(JISだったらControl↔️Caps Lockとかよくあるパターン)。UserCustomJSONから"from"のキーコードを変更することで一応はカスタマイズが可能です。

割り当てたキーのリセットは右クリックから行えます。

<img width="270" alt="ss 2024-10-30 14 52 39" src="https://github.com/user-attachments/assets/0dc50deb-f5b1-45e8-9e43-50ff0654ad07">



#### タップホールドをカスタムする
右側のサイドバーか、キーを**ダブルクリック**してポップアップから、**EnableTapHold**をトグルします。TapとHold二つのキーに対してドラッグ&ドロップをしてカスタムできます。
この時タップホールドを有効にしたのにどちらかが空の状態のままだとjsonファイル出力時にエラーが発生するので注意してください。

##### タップホールドのタイプについて
とりあえず公開版には3種類のタップホールドタイプがあります。

###### Basic
一定時間以上押下するとホールドの入力になり、それより早く他のキーが押されたり、キーを解放すると単打が入力される方式のベーシックなタップホールドです。
アルファベットのホーム行に修飾キーホールドを入れたい場合や、閾値を長めに取って誤動作をしないようにしたい場合などに有効です。


⚠️注意⚠️現在BasicタイプにLayer遷移キーを入れたときレイヤーから戻らない不具合を確認しています。
```
"to_if_held_down": [{"halt":true, "set_variable": {"name": "layer1","value": 1}}]
```
問題があるのは```"to_if_held_down"```内の```"halt":true```です。ここを消せば問題なく動くはずです。
もしくはUserCustomJSONをトグルした時にはこの不具合は出てないのでタップ・ホールドにキーを入れてトグルするのが楽です。何かわからないことがあれば[Discordサーバー](https://discord.gg/yVhZfsE2zS)で気軽に質問してください！

###### Chord
ピアノでの和音のように他のキーと組み合わせた場合にだけホールドのキーが出力されるタイプです。
閾値を持たず組み合わせの時のみホールドの出力をするのでレイヤーや修飾キーを早い指遣いで使用することができます。レイヤー遷移キーや、よく使うような修飾キーをホールドに入れる場合にこのタイプを使うことを推奨します。

###### Repeat
基本的にはChordと同じ機能ですが、
「**・ー**」のように一度タップをした後に長押しするとタップキーの長押しになる性質を持っているタイプです。
BackSpaceやDeleteForwardなど、実用上長押しもするキーをタップに入れるときに推奨されるタイプです。

※仕組み上、偶数打目のホールドがタップの長押しになる

#### レイヤーをカスタムする
Specialタブにある色付き数字キーがレイヤー遷移キーです。これをドロップしたキーが押されている間レイヤーのキーを出力するようになります。


<img width="616" alt="image" src="https://github.com/user-attachments/assets/01c0be0b-063f-42c0-a93d-3dcf79ff6feb">


例えばこのようにすれば**かな**のタップで **かな**、**かな**のホールドで**レイヤー3**に遷移します。

<img width="363" alt="image" src="https://github.com/user-attachments/assets/4ab0c286-f860-41d8-b36d-9423df68ed99">

遷移キーを設定したらそのレイヤーマップにキーをドラッグ&ドロップしてカスタマイズしましょう。
マウスカーソルの移動や、スクロールなどを行えるレイヤーの例です。
<img width="980" alt="image" src="https://github.com/user-attachments/assets/f71c40ec-8d17-44a5-9970-3d7efc2aeaf1">


### 4.jsonファイルとして出力する
右上の出力ボタンを押してPresetの概要を眺めてみましょう。壮観だなぁ〜！
実際にキーボードの書き換えを行えるようにjsonとして書き出しましょう。保存されたファイルがFinderで開いたら成功です。👏
エラーが出た場合はエラーメッセージを見て、どのキーに問題があるのかを確認、タップホールドどちらかが空欄問題ではない場合、スクショを[開発者](https://x.com/9dpbQ)に送りつけて文句を言ってください。

### 5.出力したファイルをKarabiner-Elementsで有効化する
#### ⚠️⚠️とりあえず公開版3よりKarabinerのインポート画面が自動で開くようになりました⚠️⚠️
Karabiner側でインポート、Enable Allとすれば設定が有効化できます。ファイルはファイル名が数列になっていますが以下のパスに複製されています。
```
~/.config/karabiner/assets/complex_modifications
```

#### とりあえず公開版2までは以下を参照
まず出力した時に開いたFinderのウィンドウから、**⌘T**か**⌘N**で新しくタブかウィンドウを開いて**⌘⇧G**で以下のパスを開きます。
```
~/.config/karabiner/assets/complex_modifications
```
出力したjsonファイルをcomplex_modificationsのフォルダ内にドラッグ&ドロップします。

ドラドロした後はこんな感じ
<img width="1099" alt="image" src="https://github.com/user-attachments/assets/87f8aaff-00e7-4994-a80b-ad24babb593d">


Karabiner-Elementsを開いてComplexModificationsタブからAdd predifined rule、Enable Allとすれば設定が有効になっているはずです。メモ帳やEventViewerで確認してみてください。
ドラッグ&ドロップしたのに、設定が見当たらない場合、jsonファイルとして欠陥がある可能性があります。テキストエディタでjsonファイルを開いてエラーがある部分を直せば読み込めるようになるはずです。

### 6.最強のプリセットを作り込もう！
レイヤーは8枚あるのでそれなりに余裕を持って自分なりの作業環境を構築できるはずです。
アプリ用のレイヤーを作ったり、数字入力用、記号入力用、カーソル用…と用途別に分けても覚えやすいかもしれません。
画像出力も可能なので[PureRef](https://www.pureref.com/download.php)と組み合わせて常時画面上に表示するみたいなことも可能です。
また、[開発者が自分の設定を作ってる記事](https://note.com/9dpb/n/nf41952e3e799)もあります。アプリ別なコマンドを設定したり、ちょっと細かいところまで説明してるので参考にしてみてください。

最強のプリセットが作れたら[Discordコミュニティ](https://discord.gg/yVhZfsE2zS)やXで自慢しよう！要望とかあれば頑張るかもしれない。
