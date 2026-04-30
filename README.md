# Solubility Prediction with Machine Learning & SHAP Interpretability

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.10](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/downloads/release/python-310/)

> **Researcher:** Muhammad Zubair | Rawalpindi, Pakistan  
> **Target Journal:** AAPS PharmSciTech  
> **Status:** In Progress (Phase 0 — Week 0)

---

## Overview

This repository contains the full reproducible pipeline for predicting aqueous solubility (logS) of drug-like molecules using ensemble machine learning models with SHAP-based interpretability.

We benchmark Random Forest, XGBoost, MLP, and a consensus model across three feature sets (RDKit physicochemical descriptors, Morgan fingerprints, and their combination) on the ESOL dataset (1,128 molecules), using scaffold-based train/test splits to avoid data leakage.

### Key contributions
- Rigorous scaffold-based splitting (Bemis-Murcko) to prevent data leakage
- Applicability Domain (AD) analysis with Tanimoto similarity and distance-based methods
- SHAP interpretability: beeswarm, bar, waterfall, and dependence plots
- Y-randomisation validation with p-value reported
- Feature importance stability across 5 scaffold splits

---

## Repository Structure

```
solubility-ml/
├── data/
│   ├── raw/                  # Original ESOL dataset (downloaded, not committed)
│   └── processed/            # Cleaned data, feature sets, train/test splits
├── notebooks/                # Exploratory & analysis Jupyter notebooks
├── src/                      # Python scripts (modular pipeline)
├── models/                   # Saved model files (.pkl / .joblib)
├── results/
│   ├── figures/              # All manuscript figures (≥300 DPI)
│   └── tables/               # all_results.csv and summary tables
├── supplementary/            # Supplementary figures S1, S2
├── reproducibility/          # run_all.sh + results_reproduced.md
├── environment.yml           # Conda environment (pinned)
├── requirements.txt          # pip requirements (pinned)
├── seed_config.txt           # Global random seed documentation
└── PROJECT_PLAN.md           # Full project plan with gap statement
```

---

## Quickstart

### 1. Clone the repository
```bash
git clone https://github.com/onlinezubair/solubility-ml.git
cd solubility-ml
```

### 2. Set up the environment
```bash
conda env create -f environment.yml
conda activate solubility-ml
```

Or with pip:
```bash
pip install -r requirements.txt
```

### 3. Download the dataset
```bash
wget https://deepchemdata.s3-us-west-1.amazonaws.com/datasets/delaney-processed.csv \
     -O data/raw/delaney-processed.csv
```

### 4. Run the full pipeline
```bash
bash reproducibility/run_all.sh
```

---

## Reproducibility

All results were generated with:
- **Python:** 3.10
- **Random seed:** 42 (global — see `seed_config.txt`)
- **Platform:** Ubuntu 22.04

To verify reproducibility, delete `data/processed/` and `models/`, then re-run `run_all.sh`. Metrics should match within ±0.05 RMSE.

---

## Results (to be filled in — Week 5)

| Model | Feature Set | RMSE | MAE | R² |
|-------|-------------|------|-----|----|
| Delaney (2004) baseline | — | — | — | — |
| Random Forest | Best | — | — | — |
| XGBoost | Best | — | — | — |
| Consensus (RF + XGB) | Best | — | — | — |

---

## How to Cite

If you use this code or data, please cite:

```bibtex
@article{zubair2025solubility,
  title   = {Machine Learning-Based Aqueous Solubility Prediction with SHAP Interpretability},
  author  = {Zubair, Muhammad},
  journal = {AAPS PharmSciTech},
  year    = {2025},
  doi     = {10.XXXX/XXXXXXX}
}
```

Zenodo DOI (code archive): [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)

---

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## Contact

Muhammad Zubair — Rawalpindi, Pakistan  
GitHub: [@onlinezubair](https://github.com/onlinezubair)  
ORCID: [https://orcid.org](https://orcid.org)
