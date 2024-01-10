#import "assets/modules/_conf.typ": *
#import "assets/modules/articleFig.typ": articleFig
#import "assets/modules/personHandled.typ": personHandled

#let member = json("assets/member.json")

#show: doc => conf(
  title: (
    // 表題 - 和文
    jp: [表題 -- 和文],
    // 表題 - 英文
    en: [Title -- English],
  ),
  // メンバー
  member: member.students,
  // 指導教諭
  teacher: member.teachers.join(", "),
  // 発表学科略号/発表番号
  header: "J06",
  doc,
)

= はじめに
#articleFig(
  imgPath: "img/2023-12-18-00-14-25.png",
  imgCaption: [Lenna @lenna],
)[
  #i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。 @ポラーノの広場
   
  #i Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. @lorem-ipsum
]

= 論理・実験
== 小見出し1
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

== 小見出し2
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

= 実験結果
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

= 比較・考察
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

= 結論
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

= 今後の課題
#i あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。

= 引用文献
#bibliography("refs.yml", title: [])

#pagebreak()

#let handed = (
  //
  "machida": (
    // 自分が担当したところ
    handled: [
      + XXX
    ],
    // 自分が担当したところの結果
    handledResult: [
      + XXX
      + XXX
    ],
    // 自分が担当したところの今後の課題・考察
    futureIssues: [
      + XXX
    ],
  ),
  //
  "osakada": (
    // 自分が担当したところ
    handled: [
      - Webアプリケーションの制作
      - WebアプリケーションのUI設計
      - ポスターの制作
    ],
    // 自分が担当したところの結果
    handledResult: [
      - Webアプリケーションを作成することで撮影された動画や、AIでの説明を簡単に閲覧することが可能となった。
    ],
    // 自分が担当したところの今後の課題・考察
    futureIssues: [
      - 検索機能、タグごとでのフィルター機能などのUX向上
      - レスポンシブに対応したUIの設計
      - 動画再生の補助機能
    ],
  ),
  "suzuki": (
    // 自分が担当したところ
    handled: [
      + XXX
    ],
    // 自分が担当したところの結果
    handledResult: [
      + XXX
      + XXX
    ],
    // 自分が担当したところの今後の課題・考察
    futureIssues: [
      + XXX
    ],
  ),
)

#for p in member.students {
  let hd = handed.at(p.id)
  personHandled(
    //
    person: p,
    handled: hd.handled,
    handledResult: hd.handledResult,
    futureIssues: hd.futureIssues,
  )
  if p.name != member.students.last().name {
    hr
  }
}