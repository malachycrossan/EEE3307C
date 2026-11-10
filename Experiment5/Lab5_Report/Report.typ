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
The goal of this experiment is to study small-signal transistor amplifiers built around the 2N2222 BJT. A common-emitter (CE) amplifier with and without an emitter bypass capacitor and a common-collector (emitter follower) amplifier are designed, simulated, and built. For each circuit the Q-point, maximum unclipped output, small-signal voltage gains $A_"vi" = v_o/v_i$ and $A_"vs" = v_o/v_s$, and the input and output resistances are calculated, then compared against simulation and laboratory measurements.

== Pre-Lab
Given values: $V_"CC" = 12V$, $R_C = 6.2k Omega$, $R_E = 1.8k Omega$, $R_L = 2.2k Omega$, $R_S = 1.8k Omega$, $C_E = 100 mu F$, $C_B = C_L = 10 mu F$. For the 2N2222 the lab manual gives $beta approx 150$ and $V_A approx 100V$. Throughout, $V_"BE" = 0.7V$, $V_T = k T\/q approx 26m V$ and $V_"CE(sat)" approx 0.2V$ are assumed.

=== Common-Emitter Amplifier
#figure(
  image("images/fig1_ce.png", width: 70%),
  caption: [Common-emitter amplifier],
) <fig:ce>

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
$
  R_"TH" &= R_1 || R_2 = 120k Omega || 36k Omega = 27.69k Omega \
  V_"TH" &= 12 times (36k)/(120k + 36k) = 2.769V
$

$
  I_"BQ" &= (V_"TH" - V_"BE")/(R_"TH" + (1+beta) R_E) = (2.769 - .7)/(27.69k + 151 times 1.8k) = 6.91 mu A \
  I_"CQ" &= beta I_"BQ" = 1.036m A, quad I_"EQ" = (1+beta) I_"BQ" = 1.043m A
$

$
  V_"CEQ" &= V_"CC" - I_"CQ" R_C - I_"EQ" R_E \
  &= 12 - 1.036m times 6.2k - 1.043m times 1.8k = 3.70V
$

The Q-point is therefore $(I_"CQ", V_"CEQ") = (1.04m A, 3.70V)$.
$
  R_"ac" = R_C || R_L = 6.2k || 2.2k = 1.624k Omega
$
to find the maximum unclipped output
$
  "Saturation limit:" & quad V_"CEQ" - V_"CE(sat)" = 3.70 - 0.2 = 3.50V \
  "Cutoff limit:" & quad I_"CQ" R_"ac" = 1.036m times 1.624k = 1.68V
$
The cutoff limit is smaller, so the maximum unclipped output is $approx 3.37V_"pp"$.

==== Compute the small-signal voltage gain $A_"vi" = v_o/v_i$ and $A_"vs" = v_o/v_s$
$
  g_m &= I_"CQ"/V_T = (1.036m)/(26m) = 39.86 m A\/V \
  r_pi &= beta/g_m = 150/(39.86m) = 3.763k Omega \
  r_o &= V_A/I_"CQ" = 100/(1.036m) = 96.5k Omega
$

$
  A_"vi" &= -g_m (r_o || R_C || R_L) = -39.86m times 1.597k = -63.7 \
  A_"vs" &= A_"vi" times R_i/(R_i + R_S) = -63.7 times (3.313k)/(3.313k + 1.8k) = -41.2
$

==== Compute the input and output resistances
$
  R_i &= R_1 || R_2 || r_pi = 27.69k || 3.763k = 3.31k Omega \
  R_o &= R_C || r_o = 6.2k || 96.5k = 5.83k Omega
$

=== Common-Emitter Amplifier without $C_E$
==== Compute Q-point and max unclipped output voltage
$C_E$ is an open circuit at DC, so removing it does not change the bias: the Q-point is still $(I_"CQ", V_"CEQ") = (1.04m A, 3.70V)$.

$
  R_"ac" = R_C || R_L + R_E = 1.624k + 1.8k = 3.424k Omega
$
to find max swing
$
  "Saturation:" & quad i_"c,max" = (V_"CEQ" - V_"CE(sat)")/R_"ac" = (3.70 - 0.2)/(3.424k) = 1.021m A arrow v_o = 1.021m times 1.624k = 1.66V \
  "Cutoff:" & quad i_"c,max" = I_"CQ" = 1.036m A arrow v_o = 1.036m times 1.624k = 1.68V
$
Saturation is reached first, so the maximum unclipped output is $approx 3.32V_"pp"$.

==== Compute the small-signal voltage gain Avi = vo/vi and Avs = vo/vs
The resistance looking into the base now includes the reflected emitter resistor:
$
  R_"ib" = r_pi + (1+beta) R_E = 3.763k + 151 times 1.8k = 275.6k Omega
$
$
  A_"vi" &= (-beta (R_C || R_L))/(r_pi + (1+beta) R_E) = (-150 times 1.624k)/(275.6k) = -0.884 \
  A_"vs" &= A_"vi" times R_i/(R_i + R_S) = -0.884 times (25.16k)/(25.16k + 1.8k) = -0.825
$

==== Compute the input and output resistances
$
  R_i &= R_1 || R_2 || [r_pi + (1+beta) R_E] = 27.69k || 275.6k = 25.2k Omega \
  R_o &approx R_C = 6.2k Omega
$

=== Common-Collector (Emitter Follower) Amplifier
#figure(
  image("images/fig2_ef.png", width: 70%),
  caption: [Emitter follower],
) <fig:ef>

==== Calculate $R_1$ and $R_2$
$
  R_"TH" &= .1 times (1+beta) times R_E = .1 times 151 times 1.8k Omega approx 27.2k Omega \
  V_"TH" &= V_"BE" + I_E times R_E + I_B times R_"TH" = .7 + 1.81 + .18 = 2.69V
$
$
  R_1 = R_"TH" times V_"CC"/V_"TH" = 121.2k Omega approx 120k Omega \
  R_2 = R_"TH" times V_"CC"/(V_"CC" - V_"TH") = 35.0k Omega approx 36k Omega
$
The same $R_1 = 120k Omega$ and $R_2 = 36k Omega$ were therefore used for both circuits.

==== Compute Q-point and max unclipped output voltage
$
  I_"BQ" = 6.91 mu A, quad I_"CQ" = 1.036m A, quad I_"EQ" = 1.043m A \
  V_E = I_"EQ" R_E = 1.043m times 1.8k = 1.88V \
  V_"CEQ" = V_"CC" - I_"EQ" R_E = 12 - 1.88 = 10.12V
$
The Q-point is $(I_"CQ", V_"CEQ") = (1.04m A, 10.1V)$.
$
  "Saturation limit:" & quad V_"CEQ" - V_"CE(sat)" = 10.12 - 0.2 = 9.92V \
  "Cutoff limit:" & quad I_"EQ" R_"ac" = 1.043m times 990 = 1.03V
$
The maximum unclipped output is $approx 2.07V_"pp"$, limited by cutoff.

==== Compute the small-signal voltage gain Avi = vo/vi and Avs = vo/vs
The effective emitter load is $R'_E = R_E || R_L || r_o = 1.8k || 2.2k || 96.5k = 980 Omega$.
$
  A_"vi" &= ((1+beta) R'_E)/(r_pi + (1+beta) R'_E) = (151 times 980)/(3.763k + 151 times 980) = (147.97k)/(151.73k) = 0.975 \
  A_"vs" &= A_"vi" times R_i/(R_i + R_S) = 0.975 times (23.42k)/(23.42k + 1.8k) = 0.906
$

==== Compute the input and output resistances
$
  R_i &= R_1 || R_2 || [r_pi + (1+beta) R'_E] = 27.69k || 151.7k = 23.4k Omega \
  R_o &= (r_pi + R_1 || R_2 || R_S)/(1+beta) || R_E || r_o \
  &= (3.763k + 1.690k)/151 || 1.8k || 96.5k = 36.1 || 1.8k || 96.5k = 35.4 Omega
$

/* #figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([*Parameter*], [*CE with $C_E$*], [*CE without $C_E$*], [*Emitter follower*]),
    [$I_"CQ"$], [1.036 mA], [1.036 mA], [1.036 mA],
    [$V_"CEQ"$], [3.70 V], [3.70 V], [10.12 V],
    [Max unclipped $v_o$], [1.68 V#sub[pk] (cutoff)], [1.66 V#sub[pk] (saturation)], [1.03 V#sub[pk] (cutoff)],
    [$A_"vi"$], [$-63.7$], [$-0.884$], [$0.975$],
    [$A_"vs"$], [$-41.2$], [$-0.825$], [$0.906$],
    [$R_i$], [3.31 kΩ], [25.2 kΩ], [23.4 kΩ],
    [$R_o$], [5.83 kΩ], [≈ 6.2 kΩ], [35.4 Ω],
  ),
  caption: [Summary of pre-lab calculations],
) <tab:prelab> */

== Simulation
== Experimental Procedure
The circuits of @fig:ce and @fig:ef were built on a breadboard with $R_1 = 120k Omega$, $R_2 = 36k Omega$, $C_B = C_L = 10 mu F$ and $C_E = 100 mu F$, powered from a 12 V supply.

=== Common-Emitter Amplifier
*Q-point:* $I_"CQ" = 1.11m A$, $V_"CEQ" = 2.37V$.
*Gains:* $v_s = 7.0m V_"rms"$, $v_i = 5.0m V_"rms"$, $v_o = 308m V_"rms"$
$
  A_"vs" = -(308m)/(7.0m) = -44.0, quad A_"vi" = -(308m)/(5.0m) = -61.6
$
The negative sign comes from the oscilloscope captures (@fig:pro01, @fig:pro02), where the output is 180° out of phase with the input.

*Input resistance:* $V_(R_S) = 2.3m V_"rms"$
$
  i_s = (2.3m V)/(1.8k Omega) = 1.28 mu A, quad R_i = v_i/i_s = (5.0m V)/(1.28 mu A) = 3.91k Omega
$

*Output resistance:* $v_L = 308m V_"rms"$ (with $R_L$), $v_o = 960m V_"rms"$ (without $R_L$)
$
  R_o = R_L times (v_o - v_L)/v_L = 2.2k times (960 - 308)/308 = 4.66k Omega
$

#figure(
  image("images/PRO01.png", width: 90%),
  caption: [CE amplifier, $v_s$ (CH2, green, 20 mV/div) and $v_o$ (CH1, yellow, 200 mV/div) at 5 kHz],
) <fig:pro01>

#figure(
  image("images/PRO02.png", width: 90%),
  caption: [CE amplifier, $v_i$ (CH2, green, 20 mV/div) and $v_o$ (CH1, yellow, 200 mV/div) at 5 kHz],
) <fig:pro02>

=== Common-Collector (Emitter Follower) Amplifier
*Gains:* $v_s = 7.0m V_"rms"$, $v_i = 6.6m V_"rms"$, $v_o = 6.4m V_"rms"$
$
  A_"vs" = (6.4m)/(7.0m) = 0.914, quad A_"vi" = (6.4m)/(6.6m) = 0.970
$

*Input resistance:* $V_(R_S) = 1.3m V_"rms"$
$
  i_s = (1.3m V)/(1.8k Omega) = 0.722 mu A, quad R_i = v_i/i_s = (6.6m V)/(0.722 mu A) = 9.14k Omega
$

*Output resistance:* $v_L = 6.4m V_"rms"$ (with $R_L$), $v_o = 6.5m V_"rms"$ (without $R_L$)
$
  R_o = R_L times (v_o - v_L)/v_L = 2.2k times (6.5 - 6.4)/6.4 = 34.4 Omega
$
