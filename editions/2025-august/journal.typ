#block(width: 100%)[
  #set text(24pt, weight: "regular")
  = Aspen Walker's \ Software Journal

  #set text(18pt)
  == Inaugural Edition \ August 2025
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

    The internet is an amazing invention that has provided us with a lot of benefits, but it also comes with plenty of drawbacks.
    We often gloss over the downsides of our hyper-connection, but they are real and they affect all of us.
    They can especially affect those of us who work with technology in our hobbies and careers.
    Every day is an onslaught of new frameworks, new press releases, new hot takes on the best ways to write software or manage technology.

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

    Since I was having fun using Typst for its intended purpose, naturally I decided I should use it to make a meme.
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
  title: "Call for Participation",
  subtitle: "A tantalizing opportunity...",
  author: "You?",
  contents: [
    If you would like to submit an article to this journal, please let me know!
    This is not the final draft of the August 2025 edition, so there is still time if you would like to submit your writing for this edition.
    Here is a non-exhaustive list of the kind of submissions that would fit the journal:

    - Article on a new/old technology and how you have used or would like to use it.
    - Review of a scholarly paper, conference talk, book, podcast episode, or some other form of media that is relevant to the life or work of an IT professional.
    - Spotlight on interesting technologies or projects.

    Visit our #underline[#link("https://github.com/EliasPrescott/aspen-walkers")[GitHub repo]] to find more information and start contributing!
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

      #image("./casey-talk-thumbnail.jpg", alt: "The Big OOPs: Anatomy of a Thirty-five-year Mistake")

      I would highly recommend that every programmer watch Casey's talk because I think it is a great examination of how the OOP mindset has mislead the industry in specific ways.
      His point about Alan Kay's and Bjarne Stroustrup's focus on encapsulation and the possible damage that has caused was very interesting and something I think every programmer would do well to consider.
      There are many more talks that I am looking forward to as well.
      I have heard interesting things about Eskil Steenberg and his body of work, so I am looking forward to both of his talks.
    ],
  )

  #colbreak()

  #article(
    title: "Books Every Programmer Should Know",
    subtitle: "Pro Git 2nd Edition",
    author: "Elias Prescott",
    contents: [
      Git is one of those tools that has become nearly ubiquitous for modern software development.
      Version control is a vital tool for any kind of programming, but it took a while for Git to rise to the top.
      Even now, there are plenty of competitors to Git, old and new, that still enjoy significant usage.
      But, if you are a student or a new programmer, Git is your best bet to learn.
      Even if you somehow land a job at a company that doesn't use Git, you will still benefit from understanding how Git works.
      Git has almost become the lingua franca of version control.
      To many people, Git #emph[is] version control.

      All that to say, I would highly recommend the book Pro Git @pro-git.
      It is available to read online for free.
      It is also available to download for free in PDF and EPUB formats @pro-git-web.

      I think it is a fantastic introduction to Git and the motivations behind version control.
      It introduces all the basic concepts and tools that should cover 99% of what you need for day-to-day collaboration on a programming team.
      But it also goes further in depth.
      One section covers debugging with Git, showing how you can use `git blame` and `git bisect` to quickly isolate tricky bugs and regressions in your codebases.
      The last chapter discusses the internals of Git.
      Breaking down the distinction between the plumbing and porcelain of Git.
      
      If you want a deeper understanding of Git and version control in general, I would highly recommend this book.
      Plus, you can't beat free!
    ],
  )
]

#pagebreak()

#bibliography("./references.yml")
