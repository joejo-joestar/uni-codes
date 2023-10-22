# Logic Circuit for a Full Adder with 4:1 Multiplexers

<img src="/Year%202/Digital%20Design/.assets/FullAdder-w-Multiplexer.png" alt="Full Adder with a 4:1 Multiplexer" title="Full Adder with a 4:1 Multiplexer">

---

<br>

# Truth Table:

| **ip[1]** | **ip[0]** | **cIn** | **sum** | **cOut** |
| :-------: | :-------: | :-----: | :-----: | :------: |
|     0     |     0     |    0    |    0    |    0     |
|     0     |     0     |    1    |    1    |    0     |
|     0     |     1     |    0    |    1    |    0     |
|     0     |     1     |    1    |    0    |    1     |
|     1     |     0     |    0    |    1    |    0     |
|     1     |     0     |    1    |    0    |    1     |
|     1     |     1     |    0    |    0    |    1     |
|     1     |     1     |    1    |    1    |    1     |

<br>

# Steps to Get Values for Inputs

**Table for sum:**

| **ip\cIn** | $\overline{cIn}$ | $cIn$ | **Inputs for mux** |
| :--------: | :--------------: | :---: | :----------------: |
|   **00**   |        0         |   1   |       $cIn$        |
|   **01**   |        1         |   0   |  $\overline{cIn}$  |
|   **10**   |        1         |   0   |  $\overline{cIn}$  |
|   **11**   |        0         |   1   |       $cIn$        |

<br>

**Table for cOut:**

| **ip\cIn** | $\overline{cIn}$ | $cIn$ | **Inputs for mux** |
| :--------: | :--------------: | :---: | :----------------: |
|   **00**   |        1         |   1   |         1          |
|   **01**   |        0         |   1   |       $cIn$        |
|   **10**   |        0         |   1   |       $cIn$        |
|   **11**   |        0         |   0   |         0          |
