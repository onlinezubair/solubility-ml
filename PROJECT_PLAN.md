# Project Plan — Computational Pharmaceutics & AI
**Researcher:** Muhammad Zubair | Rawalpindi, Pakistan  
**Version:** v3.0 (Final)  
**Date:** 2025-04-30

---

## 1. Research Gap Statement

> **Fill in by end of Week 0, Day 5.**

Template: *"Most solubility ML models lack [X], which our work addresses by [Y]."*

**Draft:**  
_Most published solubility prediction models lack rigorous applicability domain analysis and feature interpretability, which our work addresses by combining scaffold-based splitting with dual AD methods and SHAP-based attribution across three feature set ablations._

---

## 2. Dataset

- **Name:** ESOL (Delaney, 2004)
- **Size:** 1,128 molecules
- **Target:** logS (aqueous solubility, log mol/L)
- **Source:** `https://deepchemdata.s3-us-west-1.amazonaws.com/datasets/delaney-processed.csv`
- **Split strategy:** Scaffold-based (Bemis-Murcko), locked at Week 2, `random_state=42`

---

## 3. Feature Sets

| Set | Description | Approx. Features |
|-----|-------------|-----------------|
| A | RDKit physicochemical descriptors | ~200 |
| B | Morgan Fingerprints (radius=2, nBits=1024) | 1024 |
| C | Combined A + B | ~1200 |

- NaN handling: drop columns with >30% NaN; impute remainder with median
- `VarianceThreshold(threshold=0.01)` applied to all sets

---

## 4. Models

| Model | Notes |
|-------|-------|
| Delaney (2004) linear baseline | Expert rule-of-thumb |
| Linear Regression | Baseline |
| Random Forest | Optuna-tuned (50 trials) |
| XGBoost | Optuna-tuned (50 trials) |
| 2-layer MLP | `hidden_layer_sizes=(100,50)` |
| Consensus (RF + XGB) | Weighted by inverse CV RMSE |

---

## 5. Metrics

- RMSE, MAE, R² with 95% CI (format: `RMSE = 0.58 ± 0.03`)
- Paired t-test / Wilcoxon between model pairs (p-values in Table 2)
- Y-randomisation: 100 permutations, p-value reported

---

## 6. Applicability Domain

- **Method 1:** Tanimoto similarity (thresholds 0.3, 0.4, 0.5) — cite OECD 2014
- **Method 2:** Distance-based (Euclidean in descriptor space)
- **AD Reliability Map:** residuals vs. Tanimoto (Figure 5)

---

## 7. Target Journal

- **Primary:** AAPS PharmSciTech (no APC) — https://link.springer.com/journal/12249
- **Fallback:** *(to be filled before Week 11)*

---

## 8. Risk Register

| Risk | Probability | Mitigation |
|------|-------------|------------|
| ESOL too small | Medium | Use Lipophilicity dataset (4,200 mols) as external validation |
| SHAP RAM crash | Medium | 512 bits; `n_jobs=1`; run on X_test only |
| Reviewer demands DL | Medium | 2-layer MLP already in pipeline |
| RF / XGB R² < 0.60 | Low | Check NaN handling first |
| Novelty rejection | Medium | Benchmarking + ablation framing preempts this |

---

## 9. Data Leakage Checklist

- [ ] Scaffold-based split generated ONCE and saved before any model training
- [ ] Scaler fitted on X_train only; applied to X_test separately
- [ ] No target variable in feature set
- [ ] No look-ahead in time-series style operations
- [ ] Optuna hyperparameter tuning uses CV on training fold only
- [ ] SHAP values computed on X_test only

---

## 10. Competitor Models to Outperform

*(Fill in after literature reading — Week 0, Task 4)*

1. ___________
2. ___________
3. ___________

---

*Plan v3.0 | Muhammad Zubair, Rawalpindi, Pakistan | 2025-04-30*
