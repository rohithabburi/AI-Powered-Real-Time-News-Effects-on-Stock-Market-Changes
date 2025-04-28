FROM apache/airflow:2.8.1-python3.10

USER root

# Install msodbcsql18 with EULA acceptance
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER airflow

# Install Python dependencies for the DAG, including spacy and yfinance
RUN pip install --no-cache-dir \
    requests \
    seaborn \
    numpy \
    matplotlib \
    nltk \
    wordcloud \
    torch \
    transformers \
    pandas \
    scikit-learn \
    joblib \
    yfinance \
    spacy