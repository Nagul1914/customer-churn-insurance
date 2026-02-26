# 🔍 Customer Churn Prediction — U.S. Insurance (Travelers)

![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat&logo=scikit-learn&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## 🎯 Business Problem

A leading U.S. insurance company (modeled on Travelers) was experiencing
silent customer churn — policyholders leaving at renewal without any early
warning system. The goal: build a predictive model that identifies at-risk
customers 90 days before renewal so retention teams can intervene proactively.

## 📊 Key Results

| Metric | Result |
|--------|--------|
| Model Accuracy | 81% |
| AUC-ROC Score | 0.69 |
| Churn Reduction | 10% |
| Potential Revenue Uplift | 21% |
| Records Processed | 150,000+ |
| Top Churn Driver | Claim processing delays > 14 days |

## 🛠 Tech Stack

| Layer | Tool |
|-------|------|
| Data Processing | Python · Pandas · NumPy |
| Machine Learning | scikit-learn · SMOTE · SHAP |
| Models Used | Logistic Regression · Random Forest |
| Class Imbalance | SMOTE Oversampling |
| Explainability | SHAP Values |
| Visualization | Power BI · Matplotlib · Seaborn |
| Database | SQL (CTEs · Window Functions) |

## 📁 Project Structure
```
customer-churn-insurance/
├── data/
│   ├── raw/                    # Original Kaggle dataset
│   └── processed/              # Feature-engineered data
├── notebooks/
│   ├── 01_eda_churn_analysis.ipynb
│   ├── 02_feature_engineering.ipynb
│   ├── 03_model_training.ipynb
│   └── 04_shap_explainability.ipynb
├── models/
│   └── churn_model_rf.pkl      # Saved Random Forest model
├── sql/
│   └── churn_segmentation.sql
├── reports/
│   ├── executive_summary.md
│   └── cost_benefit_analysis.md
├── README.md
└── requirements.txt
```

## 🚀 How to Run
```bash
git clone https://github.com/Nagul1914/customer-churn-insurance
cd customer-churn-insurance
pip install -r requirements.txt

# Download dataset from Kaggle (see data/raw/README.md)
# Then run notebooks in order:
jupyter notebook notebooks/01_eda_churn_analysis.ipynb
```

## 🔍 Key Findings

- **Top churn predictor:** Claim processing delays > 14 days
- **At-risk segment:** Policyholders in years 2–3 with 2+ claims and no loyalty discount
- **SHAP insight:** Premium increases of > 12% in renewal year = 3.2x churn probability
- **Recommended action:** Target high-risk customers (score ≥ 0.7) with retention offer 90 days before renewal

## 💼 Business Recommendations

1. Fix claims processing SLA first — single highest-impact operational change
2. Launch win-back campaign targeting 5,000 high-risk accounts → modeled at $2.1M recovered revenue
3. Introduce loyalty discount trigger at year 2 for customers with clean claim history

## 👤 Author

**Nagul Meera Shaik** · Data Analyst · Jersey City, NJ
[Portfolio](https://nagul1914.github.io/nagul-portfolio) · [LinkedIn](https://linkedin.com/in/nagulshaik) · [GitHub](https://github.com/Nagul1914)
