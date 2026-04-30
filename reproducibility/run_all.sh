#!/usr/bin/env bash
# ============================================================
# run_all.sh — Full reproducibility pipeline
# Muhammad Zubair | solubility-ml
# ============================================================
# Usage: bash reproducibility/run_all.sh
# Run from the root of the repository.
# ============================================================

set -euo pipefail

echo "================================================"
echo "  Solubility-ML: Full Reproducibility Pipeline"
echo "  Started at: $(date)"
echo "================================================"

# Step 1: Download raw data
echo ""
echo "[1/6] Downloading ESOL dataset..."
mkdir -p data/raw
wget -q https://deepchemdata.s3-us-west-1.amazonaws.com/datasets/delaney-processed.csv \
     -O data/raw/delaney-processed.csv
echo "      Done."

# Step 2: EDA & preprocessing
echo ""
echo "[2/6] Running EDA and data preprocessing..."
python src/01_eda.py
echo "      Done."

# Step 3: Feature generation
echo ""
echo "[3/6] Generating feature sets (RDKit, Morgan, Combined)..."
python src/02_features.py
echo "      Done."

# Step 4: Train models
echo ""
echo "[4/6] Training all models..."
python src/03_train.py
echo "      Done."

# Step 5: Validation (Y-randomisation, AD, statistics)
echo ""
echo "[5/6] Running validation (Y-randomisation, AD, statistical tests)..."
python src/04_validate.py
echo "      Done."

# Step 6: SHAP & figures
echo ""
echo "[6/6] Generating SHAP plots and all manuscript figures..."
python src/05_shap_figures.py
echo "      Done."

echo ""
echo "================================================"
echo "  Pipeline complete at: $(date)"
echo "  Check results/tables/all_results.csv"
echo "  Check results/figures/ for all plots"
echo "================================================"
