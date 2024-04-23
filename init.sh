#!/bin/bash

# Clone course repository
REPO_URL="https://github.com/InseeFrLab/funathon2024_sujet4.git"
CLONE_DIR="/home/onyxia/work/funathon-sujet4"
git clone --depth 1 $REPO_URL $CLONE_DIR
cd $CLONE_DIR

# Install required packages
pip install -r requirements.txt
python -m spacy download fr_core_news_md

# Copy intermediary data
mkdir data
mc cp s3/projet-funathon/2024/sujet4/diffusion/reviews_planes.parquet data/reviews_planes.parquet

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/funathon-sujet4/tutoriel.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py
