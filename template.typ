#let template(
  /// the title of your thesis
  /// type: str
  title: "Thesis Title",
  /// single author name or list of author names
  /// type: str | array<str>
  author: "Author Name",
  /// date of submission
  /// type: datetime
  date: datetime(year: 1970, month: 1, day: 1),
  /// formatting template for the date
  /// type: str
  date-format: "[day].[month].[year]",
  /// List of logos to show at the top of the titlepage
  /// type: array<image>
  logos: (),
  /// Additional details to show at the bottom of the titlepage
  /// type: dictionary<str, str>
  details: (:),
  /// Your abstract
  /// type: content
  abstract: lorem(100),
  /// Dictionary of acronyms
  /// type: dictionary<str, str>
  acronyms: (:),
  /// Rest of the document
  /// type: content
  body,
) = {
  let author = if type(author) != array { (author,) } else { author }
  set document(title: title, author: author, date: date)

  set page(paper: "a4", margin: 2.5cm, numbering: "I")
  set pagebreak(weak: true)

  set text(size: 12pt, font: "CMU Sans Serif")
  set par(leading: 1em, justify: true)

  set list(indent: 0.75em)
  set enum(indent: 0.75em)

  set math.equation(numbering: "1")

  set bibliography(title: "References")
  set outline(indent: auto, depth: 2, fill: repeat(" . "))

  show par: set block(spacing: 1.5em)

  show heading.where(level: 1): set block(above: 2em, below: 2em)
  show heading.where(level: 2): set block(above: 2em, below: 1.5em)
  show heading.where(level: 3): set block(above: 1.5em, below: 1em)

  show heading.where(level: 1): set text(size: 24pt)
  show heading.where(level: 2): set text(size: 20pt)
  show heading.where(level: 3): set text(size: 16pt)

  show heading: it => {
    if it.level == 1 { pagebreak() }
    if it.numbering == none { it } else {
      grid(
        columns: (auto, auto),
        box(width: 48pt, counter(heading).display()),
        it.body,
      )
    }
  }

  show outline.entry.where(level: 1): it => [
    #if it.element.func() != heading { return it }
    #show ".": ""
    #v(8pt) #strong(it)
  ]

  show raw.where(block: true): set align(left)
  show raw.where(block: true): set par(justify: false)
  show raw.where(block: true): set text(size: 8pt)

  show raw.where(block: true): set block(
    radius: 2pt, inset: 8pt, width: 100%,
    stroke: luma(128), fill: luma(240),
  )

  show raw.where(block: false): box.with(
    radius: 2pt, inset: (x: 3pt), outset: (y: 3pt),
    stroke: luma(128), fill: luma(240),
  )

  {
    set align(center)
    set page(numbering: none)
    set par(justify: false)

    let author = author.join(" & ")
    let date = date.display(date-format)

     stack(
      spacing: 1fr,
      stack(dir: ltr, spacing: 1fr, ..logos),
      text(size: 20pt, strong(title)),
      [
        #show strong: set text(size: 14pt)
        #show strong: it => [#linebreak() #it #parbreak()]

        präsentiert dem *Fachbereich Informatik* für den *
        Bachelor of Science* an der *DHBW Stuttgart* von #strong(author) eingereicht am #strong(date)
      ],
      table(
        columns: (auto, 1fr, auto), align: left, stroke: none,
        ..details.keys().map(it => (strong(it), none)).zip(details.values()).flatten(),
      ),
    )
  }

  counter(page).update(1)

  align(horizon + center, {
    heading(outlined: false, level: 2, [Abstract])
    abstract
    pagebreak()
  })

  align(horizon, [
    #heading(outlined: false, level: 2, [Selbstständigkeitserklärung])

     Hiermit erkläre ich ausdrücklich:

    + dass die vorliegende Arbeit mit dem Titel #emph(title) vollständig von mir selbst verfasst wurde, sofern im Text oder in den Quellenangaben nichts anderes vermerkt ist, oder dass sie im Folgenden anerkannt wird;
    + dass ich die direkt oder indirekt aus anderen Quellen übernommenen Gedanken an den entsprechenden Stellen des Dokuments angegeben habe;
    + Diese Arbeit wurde weder ganz noch teilweise für einen Abschluss an dieser oder einer anderen Universität oder Einrichtung eingereicht;
    + Ich habe diese Arbeit in der Vergangenheit nicht veröffentlicht;
    + die gedruckte Fassung, falls es eine solche gibt, der eingereichten Fassung entspricht.

    Ich bin mir bewusst, dass eine unehrliche Erklärung rechtliche Konsequenzen nach sich ziehen wird.

    #v(32pt)

    Stuttgart, #date.display(date-format)
    #v(32pt)

    #line(length: 256pt)
    #author.join(", ")
  ])

  outline()

  heading(level: 1, [Acronyms])
  table(
    columns: (auto, auto), inset: (left: 0em, right: 1em), stroke: none,
    ..acronyms.keys().map(strong).zip(acronyms.values()).flatten(),
  )

  set heading(numbering: "1.1")
  set page(numbering: "1 / 1")
  counter(page).update(1)

  body
}
