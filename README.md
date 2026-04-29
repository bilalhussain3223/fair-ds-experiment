# fair-ds-experiment
# FAIR Data Science Experiment

## 📌 Project Overview

This repository contains the implementation of a FAIR-compliant data science experiment. The project follows best practices for reproducibility, transparency, and structured data management.

---

## 📁 File Organisation

The repository is structured as follows:

* `data/` → Input datasets used in the experiment
* `src/` → Source code (scripts, notebooks, pipelines)
* `outputs/` → Generated results (figures, models, logs)
* `docs/` → Documentation and reports
* `config/` → Configuration files (YAML, JSON, environment settings)

---

## 🧾 File Naming Convention

A consistent naming scheme is used across the project:

### 1. Input Data

Format:

```
data_<source>_<description>_<version>.<ext>
```

Example:

```
data_kaggle_weather_v1.csv
```

---

### 2. Output Files

#### Figures:

```
fig_<experiment>_<metric>_<date>.png
```

#### Model artefacts:

```
model_<algorithm>_<dataset>_<version>.pkl
```

#### Results:

```
results_<experiment>_<version>.csv
```

---

### 3. Scripts (src/)

```
<step>_<task_description>.py
```

Example:

```
01_data_cleaning.py
02_feature_engineering.py
03_model_training.py
```

---

### 4. Configuration Files

```
config_<purpose>.yaml
```

Example:

```
config_training.yaml
```

---

## 🔁 Reproducibility

All steps required to reproduce the experiment will be documented and updated throughout the project.

---

## 👥 Contributors

* A – Szegedy Konrad
* B – Riaz Muhammad Athar 12449141
* C – Muhammad Bilal Hussain 12442081
* D – Edeh Ekene 12451120

---

## 📜 License


