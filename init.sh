#!/bin/bash

# Check if the repository URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <repository_url>"
  exit 1
fi

# Set the repository URL
REPO_URL="$1"
CLONE_DIR="/home/onyxia/work/funathon-sujet4"

# Clone the course repository
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
