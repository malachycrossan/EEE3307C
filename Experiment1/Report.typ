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

#set page(height: auto)

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
#let title = "Experiment 1: SPICE Circuit Simulation and Equipment Usage"
#let description = ""
#set document(author: author, title: title, description: description)

#coverpage(
  title: title,
  author,
  class,
  due_date: datetime(year: 2026, month: 9, day: 15),
  last_modified: datetime.today(),
)

#counter(heading).update(1)

#pagebreak()
== Objective
== Simulation
== Experiment
#figure(
  image("DMM_I_VB-1V.PNG"),
  caption: [
  Current I of circuit $V_B = 1V$ \
  Date: 2026-09-08
  ]
)

#figure(
  image("DMM_I_VB-2V.PNG"),
  caption: [
  Current I of circuit $V_B = 2V$ \
  Date: 2026-09-08
  ]
)
#figure(
  image("Scope_Vr-t_f-5k_A-2Vpp.PNG"),
  caption: [
  $V_R$ over time \
  $f=5"kHz"$ \
  $A=2"Vpp"$ \
  Date: 2026-09-08
  ]
)

= Results
== Conclusion
