#block(width: 100%)[
  #set text(24pt, weight: "regular")
  = Aspen Walker's \ Software Journal

  #set text(18pt)
  == Inaugural Edition \ July 2025
]

#show heading.where(
  level: 2
): it => text(
  size: 18pt,
  [
    #it.body \
  ],
)

#[
  #set align(center + horizon)
  #set text(24pt)
  ```rust
  struct JournalEntry {
    title: String,
    ...
  }
  ```
]

#pagebreak()

#set page(margin: 24pt)

#let article(title: none, subtitle: none, author: none, contents: none) = {

  block(width: 100%, fill: black, inset: 8pt)[
    #set text(fill: white)
    #set par(spacing: 0.6em)
    #heading(level: 2, title)
    #block(
      line(length: 100%, stroke: (paint: white, dash: "dashed")),
    )
    #text(subtitle) \
    By #text(author)
  ]

  contents
}

#article(
  title: "New Beginnings",
  subtitle: "The goals of this journal.",
  author: "Elias Prescott",
  contents: [
    In 2025, we are more connected than ever before.
    Social media and the internet spread information faster than anything else has in human history.
    Yet, in spite of these advancements, it is easier than ever to feel alone.
    #parbreak()
    The internet is an amazing invention that has provided us with a lot of benefits, but it also comes with plenty of drawbacks.
    We often gloss over the downsides of our hyper-connection, but they are real and they affect all of us.
    The internet affects all of us, but it can especially affect those of us who work with technology.
    Every day is an onslaught of new frameworks, new press releases, new hot takes on the best ways to write software or manage technology.
    #parbreak()
    This journal is an attempt to disconnect from the constant noise.
    To build real connections rather than the fake "friendships" you find on social media.
    To consider software and the tools we use to build it, in a slow and deliberate manner.
  ],
)

#article(
  title: "Making Memes with Typst",
  subtitle: "Using the right tool for the wrong purpose.",
  author: "Elias Prescott",
  contents: [
    #grid(
      columns: (1fr, 1fr),
      rows: (auto),
      gutter: 8pt,
      [
        Typst @typst is a "markup-based typesetting system" @typst-github that is designed as a modern alternative to LaTeX.
        At the time of this writing, Typst boasts a wide array of features and can export documents to PDF, PNG, and SVG.
        Typst provides all the mathematical and typographical features you might need to create scholarly papers, but it also provides enough customizability to support more esoteric use cases.
        #parbreak()
        I have been using Typst for a while now and really enjoying it.
        I rewrote my resume from scratch using it, and I was pleasantly surprised on how easy the process was.
        The only source I needed was the official Typst documentation listed on their website @typst.
        I will say I have to jump around the docs a bit to remember the arguments for the various functions, but there is a community-built LSP (Language Server Protocol) Server for Typst that is supposedly pretty good.
      ],
      image(
        "./meme.png",
        alt: "Peter Griffin running from a low-flying airplane. The caption reads \"Don't use Typst to make memes.\"",
      ),
    )
    #parbreak()
    Since I was having fun using Typst for its intended purpose, naturally I had the idea to use it to make a meme.
    Typst is not necessarily made for this kind of image composition, but it took surprisingly little finagling to make it work.
    See @meme-code.

    #figure(
      ```typst
        #set page(width: auto, height: auto, margin: 0pt)
        #set text(48pt, font: "Impact", fill: white, stroke: (paint: black, thickness: 2pt))

        #image("griffin.jpg", width: 800pt)

        #place(
          center + bottom,
          dy: -10pt,
          [Don't use Typst to make memes],
        )
      ```,
      caption: [Example Typst code for making a basic meme.]
    ) <meme-code>
  ],
)

#pagebreak()

#article(
  title: "A Call for Participation",
  subtitle: "A tantalizing opportunity...",
  author: "You?",
  contents: [
    If you would like to submit an article to this journal, please let me know!
    This is not the final draft of the July 2025 edition, so there is still time if you would like to submit your writing for this edition.
    Here is a non-exhaustive list of the kind of submissions that would fit the journal:

    - Article on a new/old technology and how you have used or would like to use it.
    - Review of a scholarly paper, conference talk, book, podcast episode, or some other form of media that is relevant to the life or work of an IT professional.
    - Spotlight on interesting technologies or projects.
  ],
)

#columns(2)[
  #article(
    title: "The Better Software Conference",
    subtitle: "A conference to keep an eye on.",
    author: "Elias Prescott",
    contents: [
      Recently, somewhere in a small town in Sweden, there has been the inaugural meeting of the Better Software Conference @better-software-conference.
      This is a very small and exclusive conference with the goal of improving the quality of software development.
      Only a few of the talks are currently available on the YouTube channel @better-software-conference-yt, but I have loved what I have seen so far.
      Casey Muratori's opening talk on the history of OOP (Object Oriented Programming) was fascinating and I already find myself wanting to watch it again.
      I would highly recommend that every programmer watch Casey's talk because I think it is a great examination of how the OOP mindset has mislead the industry in specific ways.
      His point about Alan Kay's and Bjarne Stroustrup's focus on encapsulation and the possible damage that has caused was very interesting and something I think every programmer would do well to consider.
      There are many more talks that I am looking forward to as well.
      I have heard interesting things about Eskil Steenberg and his body of work, so I am looking forward to both of his talks.
    ],
  )
]

#pagebreak()

#bibliography("./references.yml")
