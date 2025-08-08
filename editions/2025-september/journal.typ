#set page(
  background: box(height: 100%, inset: 8pt)[
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
  "Making Your Own Browser",
  "Learning through discomfort",
  "Elias Prescott",
  [
    Recently I have started developing my own web browser.
    If you don't already know, this is a project that a lot of people would say is impossible.
    Browsers are exceptionally complicated pieces of software.
    In addition to supporting all the latest and greatest web APIs, modern browsers are expected to be backwards compatible with HTML written before I was born.

    I know that making a good browser by myself is essentially an impossible task, and that is exactly why I want to do it.
    I feel like I'm a reasonably skilled developer, but I have felt my skills stagnating at times.
    I do my best to learn new things on the job, but there's only so much you can learn when you work on the same application or the same types of problems every day.
    I'm reminded of this quote, "if you want everything to be familiar, you will never learn anything new because it can't be significantly different from what you already know."
    TODO: attribute quote.
    If I want to learn new things and grow as a developer, then I need to be willing to push myself, even when it feels hard.

    My goal is to produce a real browser that I can use for reading most websites.
    Even if I don't ever reach that goal, I will learn a lot trying.
    I've already learned a ton and I have only just started.
    Even if I never use what I've learned directly at my job, I will feel so much more confident in my abilities and knowledge.
    And if someone asks me how a browser works or how HTTPS works, I won't just be reciting something I read in a textbook years ago, I will have hard-earned war stories to share.

    I don't have much done yet.
    Just a very basic HTML parser, a super rough renderer so I can see some text in a window, and the start of a TLS implementation so my browser can speak HTTPS.
    I don't want to share my code yet because my HTML tokenizer is truly nasty.
    But it's working on a surprising number of websites already.

    Even though the code is rough and I'm already wanting to rewrite most of what I've written, I'm proud of what I'm doing.
    I'm proud that I'm reaching for the impossible.
  ]
)
