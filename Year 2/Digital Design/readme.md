# Codes from Digital Design (CS F215)

All the codes written for Digital Design course in Year 2 Sem 1.

---

## FYI

There are 4 Main Models that can be followed to write any verilog code depending on their cases:

#### Gate Level Modelling:

- As seen in [**this code**](https://github.com/joejo-joestar/uni-codes/blob/main/Year%202/Digital%20Design/Lab%20Codes%20%5BExpt%20Progs%5D/Expt03/R1_Ckt_GateModelling.sv)

- Gate level modelling uses predefined modules, mainly the basic and universal gates

<br>

#### Dataflow Modelling:

- As seen in [**this code**](https://github.com/joejo-joestar/uni-codes/blob/main/Year%202/Digital%20Design/Lab%20Codes%20%5BAssignment%20Progs%5D/Expt03/E03_Q2_Eqn_Ckt_Dataflow.sv)

- Dataflow modelling uses the `assign` keyword followed by an equation made from **Bitwise** or **Logical** Operators

<br>

#### Behavioral Modelling:

- As seen in [**this code**](https://github.com/joejo-joestar/uni-codes/blob/main/Year%202/Digital%20Design/Lab%20Codes%20%5BAssignment%20Progs%5D/Expt04/E04_Q3_Full_Subtarctor_Behavior.sv)

- Behavioral modelling uses `if... else` or `case` statements

- These statements are defined inside of loops
  
  - `always` loop: executes repeatedly after starting at time 0
  
  - `initial` loop: executes only once after starting at time 0

<br>

#### Structural Modelling:

- As seen in [**this code**](https://github.com/joejo-joestar/uni-codes/blob/main/Year%202/Digital%20Design/Lab%20Codes%20%5BSelf%20Eval%20Progs%5D/Expt04/E04_SE05_FullSubber_Struct.sv) and [**this code**](https://github.com/joejo-joestar/uni-codes/blob/main/Year%202/Digital%20Design/Lab%20Codes%20%5BExpt%20Progs%5D/Expt04/R3_parallel_adder/R3_prallel_adder.sv)

- Structural modelling uses **multiple modules** (similar to methods or functions in other programming languages) defined in the file *(or different programs(unsure))*

- Any of the above mentioned modelling can be used to define these modules

---

## How to Run the Code

Note: These codes can be run in [EDA Playground](https://edaplayground.com). 

Use the settings as shown below:

<img src="/Year%202/Digital%20Design/Media/langnlibspart1.png" alt="Language settings" title="Language settings" data-align="center">

<img src="/Year%202/Digital%20Design/Media/toolsnsimspart2.png" title="Tools & Simulators settings" alt="Tools & Simulators settings" data-align="center">
