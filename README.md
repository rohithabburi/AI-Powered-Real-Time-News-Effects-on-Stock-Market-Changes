AI-Powered Real-Time News Effects on Stock Market Changes
📈 Project Overview
This project builds an AI-powered real-time system that predicts stock market changes based on news events. It combines natural language processing (NLP) and time-series modeling (LSTM) to create a pipeline that analyzes news articles, merges them with stock data, and predicts closing prices through an interactive interface.

Key features:

Real-time news data collection.

BERT embeddings for news article representation.

LSTM-based stock price prediction.

Automated pipeline using Apache Airflow.

Web deployment via Gradio.

🛠️ System Architecture
News Data Collection:

64,269 articles over 30 days collected via Alpha Vantage API for 25 major stocks (e.g., AAPL, MSFT, TSLA).

Stock Data Collection:

Intraday 1-minute stock prices fetched using yfinance.

Preprocessing:

Merge stock and news within a 3-hour window.

Cleaned news headlines processed with spaCy.

Headlines embedded into 768-dimensional vectors using BERT.

Modeling:

LSTM model with 3 layers of 512 units each.

Input: Stock features (Open, High, Low) + BERT embeddings = 771 dimensions.

Output: Predicted closing price.

Automation:

Apache Airflow orchestrates end-to-end pipeline every 5 minutes.

Deployment:

Gradio provides a user interface for manual and automated prediction modes.

📚 Methodology
Preprocessing:

Lowercasing, lemmatization, stopword removal with spaCy.

BERT-based embeddings for news titles.

Model Training:

Optimizer: Adam (learning rate = 0.001).

Loss function: Mean Squared Error (MSE).

Early stopping with patience=50 and dynamic learning rate scheduler.

Post-processing:

Inverse transform scaled predictions.

Evaluation using MSE, RMSE, and R² metrics.

📊 Results

Metric	Value
Test MSE	31.1385 dollars²
Test RMSE	5.5802 dollars
R² Score	0.9991
Automated Pipeline RMSE	4.12 dollars
High predictive accuracy across various stock price ranges.

Low RMSE indicates small prediction errors.

Minor performance degradation noticed in extreme (low/high) priced stocks.

⚙️ ML-Ops
Tools Used:

Data Collection: Alpha Vantage API, yfinance

Preprocessing: pandas, spaCy, transformers (BERT)

Modeling: PyTorch

Automation: Apache Airflow

Deployment: Gradio

Visualization: Matplotlib

Automation:

Airflow DAG stock_news_prediction runs every 5 minutes.

Tasks include data fetching, preprocessing, model training, and prediction generation.

🚀 Deployment
Manual Mode:
Users enter a ticker and a news headline → Model predicts the stock’s closing price.

Automated Mode:
The system continuously updates every minute, collecting and predicting based on the last 3 hours of news.

🔮 Future Work
Implement Transformer-based models for time series prediction.

Incorporate social media sentiment analysis.

Deploy on AWS for scalability.

Optimize scheduling for active trading hours.

📄 References
Bollen, J., Mao, H., & Zeng, X. (2011). Twitter mood predicts the stock market

Devlin, J., Chang, M.-W., Lee, K., & Toutanova, K. (2019). BERT: Pre-training of Deep Bidirectional Transformers

Brown, T., et al. (2020). Language Models are Few-Shot Learners

Plus additional financial and AI references.

📬 Contact
For any queries or collaboration ideas, feel free to connect!
