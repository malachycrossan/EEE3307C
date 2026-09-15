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

== Objective
This lab is meant to familiarize ourselves with circuit simulation and lab equipment. We will be using LTSpice to simulate a simple circuit with a diode and resistor. Then we will build the circuit and measure the current through the diode and resistor using a digital multimeter (DMM) and an oscilloscope. We will compare the results of the simulation with the experimental results.
== Simulation
We first set up the circuit as seen in @SIM_I_VB-0V--2V. We then ran a DC sweep analysis to measure the current through the diode and resistor as a function of the voltage across the diode.
#figure(
  image("E1/vbvsIr.png",width: 80%),
  caption: [
  $I_R$ over $V_B$ (Simulation)\
  Date: 2026-09-14
  ]
)<SIM_I_VB-0V--2V>
Updating the voltage source to a 5 kHz sine wave with an amplitude of 2 Vpp, we then ran a transient analysis to measure the voltage across the resistor over time. The results can be seen in @SIM_VR-t_f-5k_A-2Vpp.
#figure(
  image("E1/Acwave.png",width: 80%),
  caption: [
  $V_R$ over time (Simulation)\
  $f=5"kHz"$ \
  $A=2"Vpp"$ \
  Date: 2026-09-14
  ]
)<SIM_VR-t_f-5k_A-2Vpp>
== Experiment
We then set up the circuit on a breadboard. The voltage source was represented by a variable power supply which was initially set to $1 V$. The resulting current in the circuit was measured using the DMM (@DMM_I_VB-1V). The voltage source was then increased to $2 V$ and the current was measured again (@DMM_I_VB-2V).

Next, we connected the circuit to a function generator set to a 5 kHz sine wave with an amplitude of 2 Vpp. The voltage across the resistor was measured using an oscilloscope (@Scope_Vr-t_f-5k_A-2Vpp).
== Results
Comparing the results of the simulation and experimental values, we can see that at the two experimental points (@DMM_I_VB-1V and @DMM_I_VB-2V) the current measured is very close to the simulated values.
#columns(2)[
#figure(
  image("DMM_I_VB-1V.PNG",width: 80%),
  caption: [
  Current I of circuit $V_B = 1V$ \
  Date: 2026-09-08
  ]
)<DMM_I_VB-1V>
#colbreak()
#figure(
  image("DMM_I_VB-2V.PNG",width: 80%),
  caption: [
  Current I of circuit $V_B = 2V$ \
  Date: 2026-09-08
  ]
)<DMM_I_VB-2V>
]
Also, the voltage across the resistor over time measured by the oscilloscope is very similar to the simulated results (@Scope_Vr-t_f-5k_A-2Vpp).

#figure(
  image("Scope_Vr-t_f-5k_A-2Vpp.PNG",width: 50%),
  caption: [
  $V_R$ over time \
  $f=5"kHz"$ \
  $A=2"Vpp"$ \
  Date: 2026-09-08
  ]
)<Scope_Vr-t_f-5k_A-2Vpp>

== Conclusion
This lab was successful in demonstrating the purpose of simulation and experimental validation. The results of the simulation and experimental measurements were very similar, indicating that the simulation was accurate. This lab also familiarized us with using LTSpice, a DMM, and an oscilloscope.
