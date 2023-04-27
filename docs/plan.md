## 令和 5 年度『課題研究』/ 研究計画書

### １．研究テーマ

#### ① 見出しとなるーマ

AI による動画短縮のための場面抽出分類システム開発

#### ② 一般的な問い

動物園に行ったとき、見に行った動物が動いていなかったり、動いているが行っている行動の意味が分からなかったりするので、動物達が何を考え行動しているかの理解を深めることのできる新しい手法を考えた。

#### ③ 具体的な問い

動画が安価で手軽に撮影出来るようになったことから、動物園などの研究機関をはじめ、留守番中のペットなど身近なところでも、常時撮影が行われている。
しかしながら、長時間撮影された動画を全て見ることは困難である。本研究では、長時間連続で撮影された動物の動画を AI 技術を用いて分析・分類し、必要な動画のみを確認できるシステムを開発した。システムは、撮影に Raspberry Pi、動画分析には GPT-4 の API を利用した。  
場面抽出分類システムは、動物の動画を「食事・遊び・特有の行動」に分類し、デスクトップアプリに表示した情報を見ることができるため、時間や場所を選ぶことなく必要な動画だけを効率よく見ることができる。 動物特有の行動を起こすタイミングは未知であるため、実際に動物園に行ってもその様子を観察できない可能性がある。  
そのためデスクトップアプリを介して分析結果のダイジェストを見れるようにできたら、動物園に行った人が動物の行動をより深く理解できるようになると考えた。  
今後は、寝ていることの多い動物園の動物たちの生態を、動画で観察できるようシステムを改良し、前述した通り人々の動物への興味関心を高めたり、動物の行動分析に活用するため、さらに精度を向上させ、詳細な分類を行うことが必要である。

### ２．研究意義

#### ① 問題の背景、問題意識

- 動物園に行ったとき見に行った動物が動いていなかったり、動いているが行っている行動の意味が分からなかったりする
- 生態活動が不明な動物がいて、その動物の生活習慣が分からない
- 動物をアプリケーション上で見ることによって、動物園に行くことができない人でも、動物たちの魅力を体験できる

#### ② 既存、先行研究との関連

- 吉田 信明、田中 正之、和田 晴太郎 行動記録を通じた動物の理解のための動物園動物観察アプリケーションの開発 ([情報処理学会](https://ipsj.ixsq.nii.ac.jp/ej/?action=repository_uri&item_id=107178&file_id=1&file_no=1))

### ３．研究方法

#### ① 研究対象

まだ未定です (ref: [GitHub Issues](https://github.com/lapsquash/lapsquash_pj/issues/3))

#### ② 研究方法

- 動物園にいる動物の動きを自動で撮影し、Raspberry Pi を用いて対象の動物が動いている場面のみを切り取り、行動（食事、特有の行動、睡眠）ごとに分類し、AI を用いて分析する。
- この分析結果をインターネットを介してデスクトップアプリで閲覧できるようにする。

##### もっと詳しく

- [squasher](https://github.com/lapsquash/lapsquash_squasher): カメラモジュールからの動画を細分化して圧縮し、アップロードを行う  
  ([Raspberry Pi](https://www.raspberrypi.org/) + [NodeJS](https://nodejs.org/ja/about) + [ffmpeg](https://www.ffmpeg.org/))
- [analyzer](https://github.com/lapsquash/lapsquash_analyzer): squasher からアップロードされた動画を GPT-4 の API で分析させ、分析結果と共に storage へ保存する  
  ([Cloudflare Workers](https://www.cloudflare.com/ja-jp/products/workers/) + [TypeScript](https://www.typescriptlang.org/) + [Hono](https://hono.dev/))
  - database: storage へ接続するためのアクセストークンの管理  
    ([Cloudflare D1](https://blog.cloudflare.com/ja-jp/introducing-d1-ja-jp/) + [MySQL](https://www.mysql.com/jp/))
  - storage: analyzer からアップロードされた動画と分析結果を保存する  
    ([GraphAPI](https://learn.microsoft.com/ja-jp/graph/use-the-api) + [SharePoint](https://www.microsoft.com/ja-jp/microsoft-365/sharepoint/collaboration))
- [viewer](https://github.com/lapsquash/lapsquash_viewer): analyzer からアップロードされた動画と分析結果を閲覧できるようにする  
  ([Vue3](https://ja.vuejs.org/) + [Nuxt3](https://nuxt.com/) + [TypeScript](https://www.typescriptlang.org/)+ [Electron](https://www.electronjs.org/ja/))

### ４．研究内容…どのような結果が予想されるのか？（見通しを立てる）

#### ① 研究仮説の設定

デスクトップアプリとインターネットを介して、動物行動をダイジェストで見れるようになる

#### ② 予備的な研究結果

- 入場者に楽しんでもらい、動物の行動についてもっと理解してもらう
- 分析によって、新しい生態傾向を見つける
- 見つけた生態傾向を比較してほかの動物との共通点を見つける。
- 動物園に来る前の事前学習などでの利用

#### ③ タイムスケジュール

[GitHub Projects](https://github.com/orgs/lapsquash/projects/1/views/5) (随時追加していきます)
