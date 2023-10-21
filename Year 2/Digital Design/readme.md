# Codes from Digital Design (CS F215)

All the codes written for Digital Design course in Year 2 Sem 1.

<br>

---

## FYI 1

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

<br>

---

## FYI 2

n-bit binary numbers can be initialized as

```verilog
input[(n-1):0] num1, num2;
output[(n-1):0] num3, num4;
// num1, num2, num3 and num4 here are both n-bit inputs/outputs
```

or

```verilog
input [(n-1):0]num1, num2;
output [(n-1):0]num3, num4;
// here, num1 and num3 is an n-bit input/output but num2 and num4 is not
```

These numbers can be specified as

```verilog
num = n'bxxxx    // n-bit binary number
num = n'dxxxx    // n-bit decimal number
num = n'hxxxx    // n-bit hexadecimal number
num = n'oxxxx    // n-bit octal number
// ('x' stands for unknown logic values)
```

<br>

for eg:

```verilog
output reg [3:0]num1; // 4-bit number
num1 = 4'd0123;

output reg [7:0]num2; // 8-bit number
num2 = 8'd01234567;
```

**Note:** `[7:0]` and `[0:7]` are different

```verilog
[7:0]num1 -> [7 6 5 4 3 2 1 0]
[0:7]num2 -> [0 1 2 3 4 5 6 7]
```

Most Significant Bits: 

- `num1 -> 7` 

- `num2 -> 0`

Least Significant Bits:

- `num1 -> 0`

- `num2 -> 7`

*i.e.,* when defining, `[(pos of msb):(pos of lsb)]`

<br>

---

## How to Run the Code

**Note:** These codes can be run in [EDA Playground](https://edaplayground.com).

Use the settings as shown below:

<p align="center">

<img src="/Year%202/Digital%20Design/.assets/langnlibspart1.png" alt="Language settings" title="Language settings" data-align="center">

<img src="/Year%202/Digital%20Design/.assets/toolsnsimspart2.png" title="Tools & Simulators settings" alt="Tools & Simulators settings" data-align="center">

</p>

<br>

---

## To View Binary Output in EPWave

EPWave defaults waveform signals to Hexadecimal (Output of [this code](Year%202/Digital%20Design/Lab%20Codes%20%5BSelf%20Eval%20Progs%5D/Expt04/SE09_GrayCodetoBinary.sv)):

<p align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Hex_op.png" alt="EPWave Hex Output" title="EPWave Hex Output" data-align="center">

</p>

To Display the waveform in Binary, Switch from `Hex` to `Binary` in the `Radix` menu

<p align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Hex_Radix.png" alt="EPWave Hex Radix" title="EPWave Hex Radix" data-align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Binary_Radix.png" alt="EPWave Binary Radix" title="EPWave Binary Radix" data-align="center">

</p>

The final output should be

<p align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Binary_op.png" alt="EPWave Binary Output" title="EPWave Binary Output" data-align="center">

</p>
