#let articleFig(
  columns: (1fr, auto),
  imgPath: "",
  imgWidth: 42mm,
  imgCaption: [],
  body,
) = {
  grid(columns: columns, gutter: 3.2mm, body, figure(
    image("../" + imgPath, width: imgWidth),
    gap: 3.2mm,
    supplement: [図],
    caption: imgCaption,
  ))
}

