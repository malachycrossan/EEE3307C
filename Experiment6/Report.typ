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
#let title = "Experiment 6: Design Project"
#let description = ""
#set document(author: author, title: title, description: description)

#coverpage(
  title: title,
  author,
  class,
  due_date: datetime(year: 2026, month: 11, day: 10),
  last_modified: datetime.today(),
)

#counter(heading).update(6)

= Objective
Design a transistor amplifier that meets given specs.

#table(columns: 3,
  [Name], [],
  [Gain], [Voltage gain of $50$ or more.], $A_v >= 50$,
  [Input Resistance], [Minimum input resistance of $15k Omega$.], $R_"in" >= 15k Omega$,
  [Output Resistance], [Output resistance less and $100 Omega$.],
  [Output Voltage], [Maximum unclipped output of $2V$ peak-to-peak.], $???$ /* TODO */,
  [Power Supply], [Power supply voltage of $9V$ and lower current drain from supply voltage.], $$/* TODO */,
  [Two stage amplifier], [A two-stage small-signal amplifier is more cost effective than a three-stage amplifier design], $$,
)

= Design steps

= Design

= Simulation

= Experiment
For our experiment, we built my lab partner's design.
It has the exact same component and net layout but with different component values.

// Brandon's design values
// schematic

// Brandon's expected values from hand-calc and sim

// gain waveform

// output resistance DMM

// input resistance no screenshots just values

// power supply current 1mA
= Conclusion
// what i learned
