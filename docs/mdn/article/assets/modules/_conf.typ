// res_article_tpl-23 v0

#let sans = ("BIZ UDPGothic")
#let mono = ("UDEV Gothic 35JPDOC")

#let conf(
  //
  title: (
    //
    jp: [表題 -- 和文],
    en: [Title -- English],
  ),
  member: (
    //
    (class: "T3A", name: "XXX XXX"),
    (class: "T3A", name: "YYY YYY"),
  ),
  teacher: "ZZZ ZZZ",
  header: [],
  doc,
) = {
  set document(title: title.jp, author: member.map(p => p.name))
  show raw: it => text(font: mono, it)

  set page(
    paper: "a4",
    margin: (top: 35.01mm, left: 30mm, right: 30mm, bottom: 30mm),
    header: header,
  )

  set text(
    font: sans,
    size: 10.5pt,
    kerning: false,
    // tracking: 10.65pt - 10.5pt,
    hyphenate: false,
  )

  set par(justify: true, leading: 21.9pt - 10.5pt)

  set heading(numbering: (..n) => {
    let level = n.pos().len()
    if level == 1 {
      numbering("1.", ..n)
    }
  }, supplement: it => ([章], [節]).at(it.level - 1, default: [章]))

  show heading: it => {
    pad(bottom: 0.3em, it)
  }

  show heading.where(level: 1): it => {
    text(size: 11pt, pad(top: 1em, left: -1em, it))
  }

  show heading.where(level: 2): it => {
    text(size: 10.5pt, it)
  }

  box(width: 100%)[
    #set align(center)
    #text(size: 14pt, weight: "bold", title.jp)\
    #text(size: 12pt, title.en)\
    #text(size: 12pt)[
      #for p in member [
        #p.class #p.name
        #if p.name != member.last().name [・]
      ]\
      指導教諭: #teacher
    ]\
    #v(1em)
  ]

  show ". ": "．"

  doc
}

#let i = h(1em)
#let hr = line(length: 100%, stroke: gray)
