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
#let title = "Experiment 3: Transistor Biasing"
#let description = ""
#set document(author: author, title: title, description: description)

#coverpage(
  title: title,
  author,
  class,
  due_date: datetime(year: 2026, month: 9, day: 29),
  last_modified: datetime.today(),
)

#counter(heading).update(2)

== Objective
To study the characteristics and the applications of bipolar junction transistors
== Pre-lab
=== Part A
#figure(image("Circuit1.b.PNG", width: 50%), caption: [Circuit 1.b])
=== Part B
$
  V_CC = 12 V\
  R_C = 1.8k Omega space R_B = 5.6k Omega space R_E = 0 Omega\
  beta = 220 "and" V_"BE" = 0.7 V\
  I_C = 2m A\
$
$
  I_C / beta &= I_B\
  (2m A) / 220 &= 9.09 mu A\
$
$
  V_"BE" = 0.7 V\
  (V_"BB" - V_"BE" ) / R_"BB" &= I_B\
  (V_"BB" - 0.7 ) / (5.6k Omega) &= 9.09 mu A\
  V_"BB" &= 750m V
$
=== Part C
$
  V_CC = 12 V\
  R_C = 1.8k Omega space R_B = 5.6k Omega space R_E = 1.8k Omega\
  beta = 220 "and" V_"BE" = 0.7 V\
  I_C = 2m A\
$
$
  I_C / beta &= I_B\
  (2m A) / 220 &= 9.09 mu A\
$
$
  V_"BE" = 0.7 V\
  (V_"BB" - V_"BE" - I_E times 1.8k Omega) / R_"BB" &= I_B\
  (V_"BB" - 0.7 - 3.6) / (5.6k Omega) &= 9.09 mu A\
  V_"BB" &= 4.35 V
$

== Exp
//SCreenshots
// 5: IC of Q1 at .75V Vbb
// 2: VCE of Q1 at .75V Vbb
// 6: Ib of Q1 at .75V Vbb
// 1: IC of Q1 at .69V Vbb
// 2: VCE of Q1 at .69V Vbb
// 3: Ib of Q1 at .69V Vbb
// 7: IC of Q2 at .69 Vbb
// 8: IC of Q3 at .69 Vbb
// 9: IC 0f Q1 at 4.35V Vbb and RE = 1.8k
// 10: IB 0f Q1 at 4.35V Vbb and RE = 1.8k
// 11: VC 0f Q1 at 4.35V Vbb and RE = 1.8k
// 12: IC of Q1 in fig3
// 13: VC of Q1 in fig3
// Scope1: VC VE and math
