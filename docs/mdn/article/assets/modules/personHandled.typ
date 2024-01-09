#let personHandled(
  person: (class: "T3A", name: "XXX XXX"),
  handled: [], /// 自分が担当したところ
  handledResult: [], /// 自分が担当したところの結果
  futureIssues: [], /// 自分が担当したところの今後の課題・考察
) = [
  #person.class #person.name\

  + 自分が担当したところ\
    #handled
  + 自分が担当したところの結果\
    #handledResult
  + 自分が担当したところの今後の課題・考察\
    #futureIssues
]