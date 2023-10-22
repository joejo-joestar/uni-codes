# Logic Circuit for a Full Subtractor with 4:1 Multiplexers

<img src="/Year%202/Digital%20Design/.assets/FullSubber-w-Multiplexer.png" alt="Full Subtractor with a 4:1 Multiplexer" title="Full Subtractor with a 4:1 Multiplexer">

---

<br>

# Truth Table:

| **ip[1]** | **ip[0]** | **bIn** | **diff** | **bOut** |
| :-------: | :-------: | :-----: | :------: | :------: |
|     0     |     0     |    0    |    0     |    0     |
|     0     |     0     |    1    |    1     |    1     |
|     0     |     1     |    0    |    1     |    1     |
|     0     |     1     |    1    |    0     |    1     |
|     1     |     0     |    0    |    1     |    0     |
|     1     |     0     |    1    |    0     |    0     |
|     1     |     1     |    0    |    0     |    0     |
|     1     |     1     |    1    |    1     |    1     |

<br>

# Steps to Get Values for Inputs

**Table for diff:**

| **ip\bIn** | $\overline{bIn}$ | $bIn$ | **Inputs for mux** |
| :--------: | :--------------: | :---: | :----------------: |
|   **00**   |        0         |   1   |       $bIn$        |
|   **01**   |        1         |   0   |  $\overline{bIn}$  |
|   **10**   |        1         |   0   |  $\overline{bIn}$  |
|   **11**   |        0         |   1   |       $bIn$        |

<br>

**Table for bOut:**

| **ip\bIn** | $\overline{bIn}$ | $bIn$ | **Inputs for mux** |
| :--------: | :--------------: | :---: | :----------------: |
|   **00**   |        0         |   1   |       $bIn$        |
|   **01**   |        1         |   1   |         1          |
|   **10**   |        0         |   0   |         0          |
|   **11**   |        0         |   1   |       $bIn$        |
