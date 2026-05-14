# Model Card: XGBoost Football Player Market Value Prediction Model

## Model description

This model predicts the market value of football players using structured football-player data. The model is an `XGBRegressor`, which is a gradient boosting regression model suitable for tabular prediction tasks. The target variable is `value_end_mln`, representing the player market value in millions.

The model uses the prepared input dataset created from the football-player valuation data used in this project. The final training workflow is implemented in the project notebook and produces the trained model artefact `models/final_model.pkl`. The model output is a continuous numeric prediction, so this is a regression task rather than a classification task.

## Intended use

The intended use of this model is to support an educational FAIR Data Science experiment about football-player market value prediction. It is used to demonstrate a reproducible machine learning workflow, including data preparation, model training, evaluation, output generation, and metadata documentation. The model can be used to analyse how well structured football-player data can predict market value.

The model is intended for academic and exploratory purposes only. It helps document the complete workflow from reused datasets to trained model and generated outputs. It should mainly be interpreted as part of a reproducible course project rather than as a professional football valuation system.

## Out-of-scope uses

The model should not be used for real transfer, scouting, contract, salary, or investment decisions. Its predictions are estimates based on the available data and modelling assumptions, not authoritative valuations of individual players. The model should also not be used to make high-stakes decisions about players, clubs, or careers.

The model is not designed for use outside the football-player market-value context. It should not be applied to other sports, other labour markets, or financial valuation problems without retraining and re-evaluation. It is also not suitable as a standalone decision-making tool because important real-world factors may be missing from the dataset.

## Training data

The training data is based on reused football-player datasets from Mendeley Data. The first source dataset is "Forward football player valuation" by Briseño and Rivera, DOI: `10.17632/cgc33scxg7.1`, published under CC BY 4.0. The second source dataset is "Transfer Value Determinants" by Ronald Nisanov, DOI: `10.17632/3btg6ptc7b.2`, also published under CC BY 4.0.

The final modelling dataset is prepared from the project input data and used to predict `value_end_mln`. The notebook performs the required loading, preparation, training, evaluation, and output generation steps. The final train/test split contains 1751 training records and 751 test records.

## Evaluation results

The task is a regression task, so classification metrics such as precision, recall, and F1 are not appropriate. Instead, the model is evaluated using regression metrics: R², mean squared error, root mean squared error, and mean absolute error. The final evaluation results are stored in `outputs/evaluation_metrics.csv`.

| Model | Target | R² | MSE | RMSE | MAE | Train size | Test size |
|---|---|---:|---:|---:|---:|---:|---:|
| XGBRegressor | value_end_mln | 0.8702 | 65.54 | 8.10 | 5.56 | 1751 | 751 |

The model achieves an R² score of 0.8702 on the test set. This means that the model explains a substantial part of the variation in the target variable. The RMSE is 8.10 and the MAE is 5.56 in the unit of the target variable, meaning millions according to `value_end_mln`.

## Limitations

The model is limited by the quality, completeness, and structure of the available football-player data. If important factors influencing market value are missing, outdated, or inconsistently represented, the model cannot fully account for them. The prediction quality therefore depends strongly on the source data and the preprocessing decisions.

The target variable reflects market value, which is not a purely objective measurement. Football-player market values may be influenced by visibility, league reputation, club status, age, nationality, media attention, and other external factors. The model can therefore reproduce patterns and biases already present in the market-value data.

The model should also be interpreted with caution because it is developed as part of a course project. It is sufficient for demonstrating a reproducible machine learning workflow, but it is not a production-ready valuation system. Further validation would be needed before using the model in any serious analytical or operational setting.

## Ethical considerations

The project uses data about identifiable football players, so the results should be presented carefully. Even though the source data is publicly available and openly licensed, predictions about individual players can still be misleading if interpreted without context. The model output should not be presented as an objective judgement of a player's ability or worth.

There is a risk that users over-interpret rankings or individual prediction errors. A model can systematically overestimate or underestimate certain groups of players depending on the training data and the available features. For this reason, the documentation should make clear that the project is educational and that the predictions are model-based estimates.

The project should avoid unnecessary publication of person-level outputs where aggregated results are sufficient. Player names and other directly identifying information should only be included when needed for reproducibility or interpretation. The preferred focus should be on model performance, workflow documentation, and responsible explanation of limitations.

## Licence

The reused input datasets are published under CC BY 4.0 and must be cited when reused. The source datasets are "Forward football player valuation", DOI `10.17632/cgc33scxg7.1`, and "Transfer Value Determinants", DOI `10.17632/3btg6ptc7b.2`. Any reuse of these datasets or derived outputs must respect the attribution requirements of CC BY 4.0.

The generated model artefact and project outputs are intended to be published under the output-data licence selected by the group, currently CC BY 4.0 unless stated otherwise in the repository or deposit metadata. The project code is intended to be published under the software licence selected by the group, for example MIT. The licences must be stated consistently in the README, repository files, RO-Crate metadata, and repository deposit records.