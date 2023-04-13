# 課題研究コンセプト

**カメラモジュールとAIを用いた動物行動のモニタリングとダイジェスト化**

## 目次

- [課題研究コンセプト](#課題研究コンセプト)
  - [目次](#目次)
  - [目的](#目的)
  - [何をして](#何をして)
  - [どうしたいか](#どうしたいか)
  - [概要](#概要)
  - [実装のフロー](#実装のフロー)


## 目的
- 動物園に行っても, 動物が動いていない or どんな行動をしているか分からない
- 生態活動が不明な動物がいる
- 動物をWeb上で見ることによって、動物園に行くことができない人でも、動物たちの魅力を体験できる

## 何をして
- 動物園の動物の動きをカメラで撮影し, 細分化してAIで動きを分析する
- 人の手を使わずに自動で観察をし続け, その結果をネットを介して見られるようにする

## どうしたいか
- 入場者に楽しんでもらい, 動物の行動についてもっと理解してもらう
- 分析によって, 新しい生態傾向を見つける
- 見つけた生態傾向を比較してほかの動物との共通点を見つける。
- 動物園に来る前の事前学習などでの利用


## 概要
動物園で動画とる→AIに分析してもらう→分析して出たデータをWEB上にわかりやすく表示する

動物園などで対象の動画を撮影し、アプリで対象の動物が動いていている場面のみを切り取り、その動画をAIに分析してもらい、動物のする行動を食事や生理現象などに分類（タグ付け）して、そのデータをWEB上に表示する。  
WEB上に表示できれば身体の不自由で動物園に行くことが困難な人でも動物を身近に感じることができ、動物の魅力を体験できる。  
さらにその動物が行う行動の意味が理解できれば動物園に行く時の事前学習になる。  
また、分析により動物の新たな生態傾向を発見することが可能である。

## 実装のフロー
- 動物を撮影する
- Raspberry Piで動物が動いている場面のみを切り取る
- 撮影した動物の動画をAiに行動ごとに分類してもらう（食事、遊び、その動物特有の行動など）
- 分類したデータをweb上に表示する
  