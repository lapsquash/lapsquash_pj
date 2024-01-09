#import "assets/modules/_conf.typ": *
#import "assets/modules/articleFig.typ": articleFig
#import "assets/modules/personHandled.typ": personHandled

#let member = (
  // クラス, 名前
  (class: "T3A", name: "XXX XXX", handled: [
    // 自分が担当したところ
    + XXX
  ], handledResult: [
    // 自分が担当したところの結果
    + XXX
    + XXX
  ], futureIssues: [
    // 自分が担当したところの今後の課題・考察
    + XXX
  ]),
  (class: "T3A", name: "YYY YYY", handled: [
    + XXX
  ], handledResult: [
    + XXX
    + XXX
  ], futureIssues: [
    + XXX
  ]),
)

#show: doc => conf(
  title: (
    // 表題 - 和文
    jp: [表題 -- 和文],
    // 表題 - 英文
    en: [Title -- English],
  ),
  // メンバー
  member: member,
  // 指導教諭
  teacher: "ZZZ ZZZ",
  // 発表学科略号/発表番号
  header: [X00],
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
#for p in member {
  personHandled(
    //
    person: p,
    handled: p.handled,
    handledResult: p.handledResult,
    futureIssues: p.futureIssues,
  )
  if p.name != member.last().name {
    hr
  }
}