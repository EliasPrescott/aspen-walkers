#set page(
  background: box(height: 100%, inset: 8pt, stroke: 16pt + gradient.linear(..color.map.rainbow))[
    #image("./cover-img.png", height: 100%)
  ],
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

#let article(title, subtitle, author, body) = {
  heading(level: 1, title)
  heading(level: 2, subtitle + " - " + author)
  line(length: 100%)
  body
}

#show link: underline

#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(13pt, weight: "regular", font: "Oxanium")
  #smallcaps(it.body)
]

#show heading.where(
  level: 2
): it => block(width: 100%)[
  #set align(center)
  #set text(11pt, weight: "regular", font: "Oxanium")
  #smallcaps(it.body)
]

#pagebreak()
#set page(background: none)
#set page(numbering: "1 of 1")
#set page(margin: 24pt)

#article(
  "Understanding React Better By Not Using It",
  "Having fun with Mithril JS",
  "Elias Prescott",
  [
    #lorem(30)
    #lorem(50)
    #lorem(20)
  ]
)
