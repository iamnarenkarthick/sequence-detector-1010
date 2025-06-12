# 1010 Sequence Detector (Mealy Machine) – Verilog

This project implements a **1010 sequence detector** using a **Mealy finite state machine (FSM)** in Verilog. The output is asserted (`out = 1`) **as soon as the input sequence "1010" is detected**.

---

## 📁 Files Included

| File Name                | Description                                         |
|-------------------------|-----------------------------------------------------|
| `sequence_detector_1010.v`    | Verilog source code for the sequence detector      |
| `sequence_detector_1010_tb.v` | Testbench for simulating the detector             |
| `Behaviour Simulation.png`   | Simulation waveform showing sequence detection     |
| `State Diagram.jpg`          | FSM state diagram for the 1010 sequence detector   |
| `schmatic.pdf`               | Circuit schematic of the FSM design                |
| `README.md`                  | Description and usage of the project               |

---

## ⚙️ How It Works

- **Input**: Serial binary input (`in`)
- **Output**: A signal (`out`) which becomes `1` when the sequence `1010` is detected
- **Clock**: The FSM transitions on the **rising edge** of `clk`
- **Reset**: Active-low asynchronous reset (`rst`)

### ➿ State Transitions:

- `S0` → Initial state
- `S1` → After receiving `1`
- `S2` → After receiving `10`
- `S3` → After receiving `101`
- When `0` is received in `S3`, the full sequence `1010` is matched, and `out` is asserted.

---

## 🧪 Simulation Instructions

1. Use any Verilog simulator such as:
   - ModelSim
   - Xilinx Vivado
   - Icarus Verilog with GTKWave

2. To compile and run using Icarus Verilog:
   ```
   iverilog -o seq_detector sequence_detector_1010.v sequence_detector_1010_tb.v
   vvp seq_detector
   ```
### 📊 To View Waveform

Add the following snippet inside your testbench:
```
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, sequence_detector_1010_tb);
end

```

Then run the simulation and open the waveform using GTKWave:

```
iverilog -o seq_detector sequence_detector_1010.v sequence_detector_1010_tb.v
vvp seq_detector
gtkwave wave.vcd
```

