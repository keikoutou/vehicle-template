# Vehicle Template
このドキュメントは、[ここ](https://www.gta5-mods.com/vehicles/)でaddon carを探して、シングルプレイヤー向けにしか対応していない車(`dlc.rpf`が入っているもの)をFiveM用に読み込めるようにするために必要なものなどを書いていく。

## 必要なツール
* [OpenIV](https://openiv.com/)
* [CodeWalker](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map)

※`OpenIV`と`CodeWalker`は、`dlc.rpf`を開くためのツールなので、どちらか片方が使える状態であれば良い。

## 注意
だいたいこうすればうまくいくという感じなので、失敗しても責任は取りません。

## 手順
1. 使用したい車をダウンロードしてきて、`dlc.rpf`が入っているか確認する。

2. `dlc.rpf`を`OpenIV`もしくは`CodeWalker`で開く。ここでは`OpenIV`で開くことにする。

3. `dlc.rpf`は以下のようなフォルダ構成になっている(フォルダ構成、フォルダ名、ファイル名などが異なることがほとんどなので注意すること)。


<pre>
dlc.rpf
├─ audioconfig
│  ├─ sfx
│  │  ├─ vehiclename.awc
│  │  └─ vehiclename_npc.awc
│  ├─ vehiclename_game.dat151
│  ├─ vehiclename_game.dat151.nametable
│  ├─ vehiclename_game.dat151.rel
│  ├─ vehiclename_sounds.dat54
│  ├─ vehiclename_sounds.dat54.nametable
│  └─ vehiclename_sounds.dat54.rel
├─ data
│  ├─ carcols.meta
│  ├─ carvariations.meta
│  ├─ dlctext.meta
│  ├─ handling.meta
│  └─ vehicles.meta
├─ x64
│  ├─ data
│  │  └─ lang
│  │      └─ americandlc.rpf
│  │          └─ global.gxt2
│  ├─ mods.rpf
│  │  └─ *.yft
│  └─ vehicles.rpf
│      ├─ vehiclename.yft
│      ├─ vehiclename.ytd
│      └─ vehiclename_hi.yft
├─ content.xml
└─ setup2.xml
</pre>


* `audioconfig`フォルダ
  * 独自にエンジン音などを作っているaddon carに含まれていることがある。
  * このフォルダに含まれるファイルは`audio`フォルダに入れて、`fxmanifest.lua`で読み込む必要がある。

* `data`フォルダ
  * `.meta`ファイルは車の性能の設定などが可能。
  * このフォルダに含まれるファイルは`fxmanifest.lua`で読み込む必要がある。
  * `dlctext.meta`は使用しないので、無視でOK。

* `x64`フォルダ
  * 車のモデルや外装カスタム(リバリーやスポイラーなど)のモデルが入っている。
  * モデルデータは`.ytd`や`.yft`として入っていて、`.rpf`でまとめられていることが多い。
  * 車体のモデルデータは`stream`フォルダに入れて、外装カスタムなどのモデルデータは`modkit`フォルダに入れる。
  * `x64/data/lang`フォルダは、言語データ(`.gxt2`ファイル)が入っているが、このままだとFiveMでは読み込めない。`names.lua`を使用してFiveMで読み込めるようにする必要がある。

* `content.xml`と`setup2.xml`
  * FiveMでは使用しないと思われるファイル。無視でOK。


4. 3.までのことを実施すると、FiveMでリソースとして読み込むための構成は以下のようになる。

<pre>
vehicle-template
├─ audio
│  ├─ sfx
│  │  ├─ vehiclename.awc
│  │  └─ vehiclename_npc.awc
│  ├─ vehiclename_game.dat151
│  ├─ vehiclename_game.dat151.nametable
│  ├─ vehiclename_game.dat151.rel
│  ├─ vehiclename_sounds.dat54
│  ├─ vehiclename_sounds.dat54.nametable
│  └─ vehiclename_sounds.dat54.rel
├─ data
│  ├─ carcols.meta
│  ├─ carvariations.meta
│  ├─ handling.meta
│  └─ vehicles.meta
├─ stream
│  ├─ modkit
│  │  └─ *.yft
│  ├─ vehiclename.yft
│  ├─ vehiclename.ytd
│  └─ vehiclename_hi.yft
├─ fxmanifest.lua
└─ names.lua
</pre>

5. ファイルの中身は入れる車によって異なると思うので、うまく調整すること。特に`audio`周り、`fxmanifest.lua`、`names.lua`。
