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
#let title = "Experiment 5: Transistor Small-Signal Amplifiers"
#let description = ""
#set document(author: author, title: title, description: description)

#coverpage(
  title: title,
  author,
  class,
  due_date: datetime(year: 2026, month: 11, day: 10),
  last_modified: datetime.today(),
)

#counter(heading).update(5)

== Objective
== Pre-Lab
=== Common-Emitter Amplifier
// fig1 with values from LTSPICE
// VCC = 12 V,
//  RC = 6.2 kΩ,
//  RE = 1.8 kΩ,
//  RL = 2.2 kΩ,
//  RS = 1.8 kΩ,
//  CE = 100 μF.
//  CL = 10uF
//  CB = 10uF
==== Calculate $R_1$ and $R_2$
Targeting $I_"CQ" approx 1m A$
$
  R_"TH" &= .1 times (1+beta) times R_E \
  &= .1 times 151 times 1.8k Omega approx 27.2k Omega \
$

$
  I_B = (1m A)/150 = 6.67mu A \
  I_E = I_B times (1+ beta) = 1.007m A \
$
  
$
  V_"TH" &= V_"BE" + I_E times R_E + I_B times R_"TH" \
  &= .7 + 1.81 + .18 = 2.69V
$

$
  V_"TH" = V_"CC" times R_2/(R_1+ R_2) \
  R_1 = 121.249k Omega approx 120k Omega \
  R_2 = 35.033k Omega approx 36k Omega \
$

==== Compute Q-point and max unclipped output voltage
==== Compute the small-signal voltage gain $A_"vi" = v_o/v_i$ and $A_"vs" = v_o/v_s$
==== Compute the input and output resistances
=== Common-Emitter Amplifier without $C_E$
==== Compute Q-point and max unclipped output voltage
==== Compute the small-signal voltage gain Avi = vo/vi and Avs = vo/vs
==== Compute the input and output resistances

=== Common-Collector (Emitter Follower) Amplifier
==== Calculate $R_1$ and $R_2$
==== Compute Q-point and max unclipped output voltage
==== Compute the small-signal voltage gain Avi = vo/vi and Avs = vo/vs
==== Compute the input and output resistances

== Simulation
=== Common-Emitter Amplifier
=== Common-Emitter Amplifier without $C_E$
=== Common-Collector (Emitter Follower) Amplifier

== Experimental Procedure
