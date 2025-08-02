#set page(
  background: image("./cover-img.png", height: 100%),
)

#block(width: 100%)[
  #set text(28pt, font: "Oxanium", weight: 800, fill: white, stroke: black)
  = Aspen Walkers \ Software Journal
]

#align(center + horizon)[
  #block()[
    #set text(28pt, font: "Oxanium", weight: 800, fill: white, stroke: black)
    == September 2025
  ]
]

#show link: underline

#show heading.where(
  level: 2
): it => text(
  size: 18pt,
  [
    #it.body \
  ],
)

#pagebreak()
#set page(background: none)
#set page(numbering: "1 of 1")
#set page(margin: 24pt)
