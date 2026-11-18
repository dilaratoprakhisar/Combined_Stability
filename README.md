# Combined Stability: Protecting against Combined Attacks

VHDL hardware implementation of a combined-secure AES S-box (protected against both side-channel and fault attacks) using the *combined stability* countermeasure.

## Paper

This repository accompanies the following paper:

> Dilara Toprakhisar, Svetla Nikova, and Ventzislav Nikov. **Combined Stability: Protecting against Combined Attacks**. *IACR Transactions on Cryptographic Hardware and Embedded Systems (TCHES)*, 2026.
> DOI: [10.46586/tches.v2026.i1.660-687](https://doi.org/10.46586/tches.v2026.i1.660-687) · ePrint: [2025/1692](https://eprint.iacr.org/2025/1692)


If you use this code, please cite:

```bibtex
@article{toprakhisar2026combined,
  author  = {Dilara Toprakhisar and Svetla Nikova and Ventzislav Nikov},
  title   = {Combined Stability: Protecting against Combined Attacks},
  journal = {IACR Transactions on Cryptographic Hardware and Embedded Systems},
  volume  = {2026},
  number  = {1},
  pages   = {660--987},
  year    = {2026},
  doi     = {10.46586/tches.v2026.i1.660-687},
  note    = {Full version: Cryptology ePrint Archive, Paper 2025/1692}
}
```

# Combined Stability: Combined-Secure AES S-box

VHDL hardware implementation of a combined-secure AES S-box (protected against both side-channel and fault attacks) using the *combined stability* countermeasure, targeting the Xilinx Spartan-6 FPGA on the SAKURA-G board.

## Paper

This repository accompanies the following paper:

> Dilara Toprakhisar, Svetla Nikova, and Ventzislav Nikov. **Combined Stability: Protecting against Combined Attacks**. *IACR Transactions on Cryptographic Hardware and Embedded Systems (TCHES)*, 2026.
> DOI: [10.46586/tches.v2026.iX.XXX-XXX](https://doi.org/10.46586/tches.v2026.iX.XXX-XXX) · ePrint: [2025/1692](https://eprint.iacr.org/2025/1692)

If you use this code, please cite:

```bibtex
@article{toprakhisar2026combined,
  author  = {Dilara Toprakhisar and Svetla Nikova and Ventzislav Nikov},
  title   = {Combined Stability: Protecting against Combined Attacks},
  journal = {IACR Transactions on Cryptographic Hardware and Embedded Systems},
  volume  = {2026},
  number  = {X},
  pages   = {XXX--XXX},
  year    = {2026},
  doi     = {10.46586/tches.v2026.iX.XXX-XXX},
  note    = {Full version: Cryptology ePrint Archive, Paper 2025/1692}
}
```

## Repository structure

All files are in the repository root. The main ones are:

| File | Description |
|---|---|
| `AES_S_box.vhd` | Top-level entity of the protected AES S-box. |
| `S_box_AES_3_9.vhd` | Masked, six-stage pipelined GF(2^8) inversion. |
| `sbox_ph1.vhd` – `sbox_ph6.vhd` | The six pipeline stages of the inversion. |
| `MPC_globals.vhd` | Package with global constants and types (e.g. number of shares `D = 3`). Compile first. |
| `testbench.vhd` | Simulation testbench for `AES_S_box`. |
| `sakura_g_main_top.bit`, `sakura_g_ctrl_top.bit` | Bitstreams for the SAKURA-G main and control FPGAs. |

The remaining `.vhd` files are the building blocks used by these modules: finite-field multipliers, randomness refreshing and share recombination layers, pipeline registers, and the affine transformation.

## Requirements

- **Language:** VHDL (VHDL-93)
- **Synthesis tools:** Xilinx ISE 14.7 (the release used for the provided bitstreams and pad report)
- **Target device:** Xilinx Spartan-6 XC6SLX75T, speed grade -2, package FGG676
- **Board:** SAKURA-G side-channel evaluation board (main and control FPGA)

## Build and run

Clone the repository:

```bash
git clone https://github.com/dilaratoprakhisar/Combined_Stability.git
cd Combined_Stability
```

### Running on the SAKURA-G board

Program the two FPGAs with the provided bitstreams:

- `sakura_g_ctrl_top.bit` → control FPGA
- `sakura_g_main_top.bit` → main FPGA

## Licence

This project is licensed under the MIT licence. See the LICENSE file for details.

## Authors and contact

- Dilara Toprakhisar, COSIC, KU Leuven
- Svetla Nikova, COSIC, KU Leuven
- Ventzislav Nikov, NXP Semiconductors

For questions about the code, contact Dilara Toprakhisar at dilara.toprakhisar@esat.kuleuven.be.


For questions about the code, contact Dilara Toprakhisar at dilara.toprakhisar@esat.kuleuven.be, or open an issue in this repository.
