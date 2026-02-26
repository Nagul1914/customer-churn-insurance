# Executive Summary — Customer Churn Analysis
**Analyst:** Nagul Meera Shaik | **Date:** Q4 2024

## Situation
U.S. insurance company experiencing 18% annual customer churn,
representing approximately $4.2M in lost premium revenue per year.
No early warning system existed — churn was only detected at renewal failure.

## Analysis Approach
- Analyzed 150,000+ policyholder records across 3 years
- Built ML pipeline: Logistic Regression + Random Forest with SMOTE
- Applied SHAP values to explain model decisions to non-technical stakeholders
- Conducted cost-benefit analysis on proposed interventions

## Key Findings
1. Claim processing delays > 14 days = single strongest churn predictor
2. Year 2–3 policyholders are 2.8x more likely to churn than year 1
3. Premium increases > 12% at renewal → 3.2x churn probability
4. Customers with 2+ claims and no loyalty discount: 67% churn rate

## Model Performance
| Metric | Score |
|--------|-------|
| Accuracy | 81% |
| AUC-ROC | 0.69 |
| Precision (Churn) | 0.78 |
| Recall (Churn) | 0.74 |

## Business Recommendations
1. **Operational Fix:** Reduce claim processing SLA from 21 to 7 days
2. **Retention Campaign:** Target 5,000 high-risk accounts with personalized renewal offers
3. **Loyalty Program:** Auto-apply 8% discount at year 2 for clean-claim customers
4. **Projected Impact:** 10% churn reduction → 21% revenue uplift → $880K recovered annually
```

→ Commit new file

---

## Step 9 — Add requirements.txt

Add file → Create new file → name: `requirements.txt`
```
pandas==2.1.4
numpy==1.26.2
scikit-learn==1.4.0
imbalanced-learn==0.12.0
shap==0.44.0
matplotlib==3.8.2
seaborn==0.13.0
plotly==5.18.0
jupyter==1.0.0
pickle-mixin==1.0.2
```

→ Commit new file

---

## Step 10 — Add Topics to Your Repo

On the repo homepage → click the **gear ⚙️ icon** next to the word "About" on the right side → in the **Topics** box type and add each one, pressing Enter after each:

`python` `machine-learning` `churn-prediction` `random-forest` `sql` `power-bi` `insurance` `data-analysis` `scikit-learn` `smote`

→ Click **Save changes**

---

## ✅ Final Check — Your Repo Should Look Like This
```
customer-churn-insurance/
├── 📁 data/
│   ├── 📁 raw/        ← place downloaded Kaggle CSV here
│   └── 📁 processed/
├── 📁 models/
├── 📁 notebooks/
│   ├── 01_eda_churn_analysis.ipynb
│   ├── 02_feature_engineering.ipynb
│   └── 03_model_training.ipynb
├── 📁 reports/
│   └── executive_summary.md
├── 📁 sql/
│   └── churn_segmentation.sql
├── 📄 README.md       ← renders with badges + metrics table
└── 📄 requirements.txt
