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
#let title = "Experiment 2: Diodes and Applications"
#let description = "To study the characteristics and the applications of PN junction diodes"
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
To study the characteristics and the applications of PN junction diodes
== Pre-lab
=== Rectifiers
The first circuit we set up was a simple half-wave rectifier.
We first simulated the circuit in LTSpice. We chose $100 mu F$ and $2 k Omega$. @SimA1 shows the circuit without the capacitor and @SimA2 shows the circuit with the Resistor. @SimA3 shows the circuit with both in.
#figure(image("assets/withoutCapPL.png",width: 100%), caption: ["Half-wave rectifier without capacitor"])<SimA1>
#figure(image("assets/withoutResistorPb.png",width: 100%), caption: ["Half-wave rectifier without resistor"])<SimA2>
#figure(image("assets/partcprelab.png",width: 100%), caption: ["Half-wave rectifier with both capacitor and resistor"])<SimA3>

The next circuit was a full-wave rectifier. We first simulated the circuit in LTSpice. We chose $100 mu F$ and $2 k Omega$. @SimAB1 shows the circuit without the capacitor and @SimAB2 shows the circuit with the Resistor. @SimAB3 shows the circuit with both in.

#figure(image("assets/fig2p1.png",width: 100%), caption: ["Half-wave rectifier without capacitor"])<SimAB1>
#figure(image("assets/fig2p2.png",width: 100%), caption: ["Half-wave rectifier without resistor"])<SimAB2>
#figure(image("assets/fig2p3.png",width: 100%), caption: ["Half-wave rectifier with both capacitor and resistor"])<SimAB3>

=== Clipping circuits
We determined the transfer characteristics and output waveforms of the clipper circuits using LTSpice.
The first circuits transfer characteristics are showing in @SimB1 and the output waveforms are shown in @SimB2. The second circuits transfer characteristics are showing in @SimB3 and the output waveforms are shown in @SimB4.

#figure(image("assets/fig3TranserChar.png",width: 100%), caption: ["Clipping circuit 1 transfer characteristics"])<SimB1>
#figure(image("assets/fig3outputWave.png",width: 100%), caption: ["Clipping circuit 1 output waveforms"])<SimB2>
#figure(image("assets/fig4Tramsferchar.png",width: 100%), caption: ["Clipping circuit 2 transfer characteristics"])<SimB3>
#figure(image("assets/fig4outputWave.png",width: 100%), caption: ["Clipping circuit 2 output waveforms"])<SimB4>

=== Clamping circuits
For the clamping circuit, we used the values in @ValC1. The output is shown in @SimC1.
$
  R = 2 k Omega\
  C = 100 mu F\
  V_B = 3 V\
  "Diode: 1N4148"\
$ <ValC1>

#figure(image("assets/fig5partoutput.png",width: 100%), caption: ["Clamping circuit output waveforms"])<SimC1>

== Experiment
Experimental results are below

#figure(image("assets/P5W20K01.PNG",width: 80%), caption: [Half-wave rectifier $f=100 "Hz"$ $A=5 V$]) <Exp1>
#figure(image("assets/P5W20K02.PNG",width: 80%), caption: [Half-wave rectifier with capacitor removed $f=100 "Hz"$ $A=5 V$]) <Exp2>
#figure(image("assets/P5W20K03.PNG",width: 80%), caption: [Half-wave rectifier with resistor removed $f=100 "Hz"$ $A=5 V$]) <Exp3>
#figure(image("assets/P5W20K04.PNG",width: 80%), caption: [Half-wave rectifier with triangular wave $f=100 "Hz"$ $A=5 V$]) <Exp4>
#figure(image("assets/P5W20K05.PNG",width: 80%), caption: [Half-wave rectifier with square wave $f=100 "Hz"$ $A=5 V$]) <Exp5>


#figure(image("assets/P5W20K06.PNG",width: 80%), caption: [Full-wave rectifier without capacitor $f=100 "Hz"$ $A=5 V$]) <Exp6>
#figure(image("assets/P5W20K07.PNG",width: 80%), caption: [Full-wave rectifier with capacitor $f=100 "Hz"$ $A=5 V$]) <Exp7>
#figure(image("assets/P5W20K09.PNG",width: 80%), caption: [Full-wave rectifier with triangular wave $f=100 "Hz"$ $A=5 V$]) <Exp9>
#figure(image("assets/P5W20K08.PNG",width: 80%), caption: [Full-wave rectifier with square wave $f=100 "Hz"$ $A=5 V$]) <Exp8>


#figure(image("assets/P5W20K10.PNG",width: 80%), caption: [Clipping circuit 1 $f=1 k"Hz"$ $A=10 V$\ Ch1: $V_"in"$ \ Ch2: $V_"out"$ \ ]) <Exp10>
#figure(image("assets/P5W20K12.PNG",width: 80%), caption: [Clipping circuit 1 $f=1 k"Hz"$ $A=5 V$\ Ch1: $V_"in"$ \ Ch2: $V_"out"$ \ ]) <Exp12>
#figure(image("assets/P5W20K13.PNG",width: 80%), caption: [Clipping circuit 1 $f=1 k"Hz"$ $A=2 V$\ Ch1: $V_"in"$ \ Ch2: $V_"out"$ \ ]) <Exp13>
#figure(image("assets/P5W20K14.PNG",width: 80%), caption: [Clipping circuit 1 with triangular wave $f=1 k"Hz"$ $A=10 V$\ Ch1: $V_"in"$ \ Ch2: $V_"out"$ \ ]) <Exp14>
#figure(image("assets/P5W20K15.PNG",width: 80%), caption: [Clipping circuit 1 with square wave $f=1 k"Hz"$ $A=10 V$\ Ch1: $V_"in"$ \ Ch2: $V_"out"$ \ ]) <Exp15>


#figure(image("assets/P5W20K16.PNG",width: 80%), caption: []) <Exp14>
#figure(image("assets/P5W20K16.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K17.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K18.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K19.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K20.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K21.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K22.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K23.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K24.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K25.PNG",width: 80%), caption: [])
#figure(image("assets/P5W20K26.PNG",width: 80%), caption: [])

== Conclusion
In this lab, we studied the characteristics and applications of PN junction diodes. We simulated and built half-wave and full-wave rectifiers, clipping circuits, and clamping circuits. The experimental results closely matched the simulation results, confirming our understanding of diode behavior in various circuit configurations.