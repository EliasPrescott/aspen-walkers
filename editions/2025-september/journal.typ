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

#let article(title, subtitle, body) = {
  heading(level: 1, title)
  heading(level: 2, [
    #subtitle
  ])
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

#columns(2)[
  #article(
    "The Pomodorino Technique",
    [
      By Luke Arnould.
      #link("https://luke.arnoulds.net/posts/2025-08-13-pomodorino/")[Read on Luke's blog]
    ],
    [
      Dilluting my work day with frequent minor breaks is important to me, because if I don’t give myself periodic breaks I have a tendency to work myself into a frenzy which leaves me feeling tired and sometimes stressed.
      Most are well-familiar with the Pomodoro technique which divides the work day into 25 minute focused-work segments separated by 5 minute breaks, and every couple cycles a 15-ish minute long break.

      === The Problem

      I am a fan of this but find it to be too restrictive.
      If I only have time in my day between meetings for a long break earlier in the morning, I can’t wait for the 4-5 cycles to pass for my long break to happen.
      I won’t get one if I try to follow those constraints.
      And 5 minute breaks can leave you feeling like you’re waiting for the shift bell to buzz and begin working like a drone bee again.

      === My Approach

      I have over time made my own variation for personal practice.
      It’s simple enough that maybe it’s not worth even writing about.
      But I did have some people interested in my approach so you’re stuck reading this.
      I like to call it “pomodorino” because Google tells me that is the word for a small tomato (where pomodoro is the name for a normal tomato).
      It’s a cute name at least.
      The idea is that 25-minute work segments: good.
      You are never looking at an afternoon with dread, because you know it’ll be broken up into very approachable work segments.
      The 5 minute break… eh.
      Somewhere close to that.
      Don’t set a timer, just get up and walk around a bit.
      Maybe around the building.
      Or maybe take care of some personal business, respond to some texts.
      It’s up to you.
      It doesn’t feel like much of a break if you’re eyeing a clock the entire time.
      Where to place the long breaks?
      Just at any point in each half of your work day, once before lunch and once after lunch for 15-20 minutes each.
      I like to go on walks for mine to get my daily 7k steps but to each their own.
      Sometimes I feel like I’m going to die if I don’t get enough sunshine in a day.
      Offices can feel very oppressive, the sterile light and clinical clean workspaces.
      But I do like talking to the people.

      === Let’s Summarize

      - 25 minute work session
      - 5-10 minute break (not timed!!)
      - Repeat the above two steps in all the time you have
      - 15-20 minute long break sometime in each half of the day
    ]
  )

  #colbreak()

  #article(
    "Making Your Own Browser",
    "Learning through discomfort - by Elias Prescott",
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

      I don't think this is a project that everyone should attempt.
      But I do think every one should find ways to push themselves and work on things that make them uncomfortable.
      Because that is when you grow the most.
    ]
  )
]
