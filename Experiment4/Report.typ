#let coverpage(title: str, author, class, due_date: datetime, last_modified: datetime) = [
  #align(center, [
  #v(6em)
  #text(14pt, weight: "bold", title)
  #v(2em)
  #text(12pt, style: "italic", author.join(" & "))
  #v(1em)
  #text(style: "italic", class)
  #v(1em)
  #grid(
    columns: 2,
    gutter: 8pt,
    "Due Date:", due_date.display(),
    "Last modified:", last_modified.display(),
  )
])
#pagebreak()
]

#set text(font: "Liberation Serif", size: 10pt)
#set par(justify: false)
#show raw.where(lang: "python"): it => rect(text(size: 6pt,it), width: 100%, radius: .5em, inset: 1em,)
#show math.equation.where(block: true):  it => rect(it,radius: 1em, inset: 1em, fill: silver)
#set math.equation(numbering: "Eq 1")
#set figure(kind: image)
#set heading(numbering: "1.A.1.a")
#let mathHeading(content) = text(
  size: 15pt,
  fill: blue.darken(40%),
  content,
)

//#set page(height: auto)

// Footer with "Page X of Y"
#show: page.with(
  footer: align(center)[#context[
    Page #counter(page).display() of #counter(page).final().first()
  ]],
)

#let author = (
  "Malachy Crossan",
  "Brandon Saavedra",
  )
#let class = "EEE3307-C0013: Electronics I"
#let title = "Experiment 4: Transistor AC Amplifiers"
#let description = ""
#set document(author: author, title: title, description: description)

#coverpage(
  title: title,
  author,
  class,
  due_date: datetime(year: 2026, month: 10, day: 27),
  last_modified: datetime.today(),
)

#counter(heading).update(4)

== Objective
To study AC Amplifiers.
== Pre-laboratory
#figure(image("Fig1.png"))
$
  V_"CC" = 12V \
  R_C = 6.2k Omega \
  R_E = 1.8k Omega \
  R_L = 2.2k Omega \
$
=== Calculate $R_1 "and" R_2$
$
  I_"CQ" approx 1 m A \
  R_"BB" = 0.1 times (beta+1) times R_E \
  R_1 = 120k Omega \
  R_2 = 36k Omega \
$
//middle of AC load line calc
$
  
$
== Conclusion
