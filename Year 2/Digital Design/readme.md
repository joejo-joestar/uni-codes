# Codes from Digital Design (CS F215)

All the codes written for Digital Design course in Year 2 Sem 1.

Most of theme programs can be simulated on [EDA Playground] (https://edaplayground.com) ([see below](#how-to-run-the-code)).

The FPGA programs require an FPGA to test on. The software used for those experiments is the [Intel Quartus® Prime](https://www.intel.com/content/www/us/en/software-kit/825278/intel-quartus-prime-lite-edition-design-software-version-23-1-1-for-windows.html).

<br>

---

## FYIs

- [Types of Modelling Verilog Codes](/Year%202/Digital%20Design/.FYI1.md)
- [MultiBit Numbers](/Year%202/Digital%20Design/.FYI2.md)
- [Basic Gates with Universal Gates](/Year%202/Digital%20Design/.FYI3.md)
- [Boolean Operations](/Year%202/Digital%20Design/.FYI4.md)
- [Common Tables for Flip Flops and Stuff](/Year%202/Digital%20Design/.FYI5.md)

<br>

---

## How to Run the Code

**Note:** These codes can be run in [EDA Playground](https://edaplayground.com).

Use the settings as shown below:

<div align="center">

<img src="/Year%202/Digital%20Design/.assets/langnlibspart1.png" alt="Language settings" title="Language settings" data-align="center">

<img src="/Year%202/Digital%20Design/.assets/toolsnsimspart2.png" title="Tools & Simulators settings" alt="Tools & Simulators settings" data-align="center">

</div>

<br>

---

## To View Binary Output in EPWave

EPWave defaults waveform signals to Hexadecimal (Output of [this code](Year%202/Digital%20Design/Self%20Evaluation%20Programs/Expt04/SE09_GrayCodetoBinary.sv)):

<div align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Hex_op.png" alt="EPWave Hex Output" title="EPWave Hex Output">

</div>

To Display the waveform in Binary, Switch from `Hex` to `Binary` in the `Radix` menu

<div align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Hex_Radix.png" alt="EPWave Hex Radix" title="EPWave Hex Radix">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Binary_Radix.png" alt="EPWave Binary Radix" title="EPWave Binary Radix">

</div>

The final output should be

<div align="center">

<img src="/Year%202/Digital%20Design/.assets/EPWave_Binary_op.png" alt="EPWave Binary Output" title="EPWave Binary Output">

</div>

<br>

---

## Useful VS Code Extensions
- Formatting, Snippets and Syntax Highlighting [Masahiro Hiramori | Verilog-HDL/SystemVerilog/Bluespec SystemVerilog](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL)
