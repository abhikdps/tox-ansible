#!/bin/bash

# Variables
COLLECTION_NAME=$1

# Install ansible-creator if not already installed
if ! command -v ansible-creator &> /dev/null
then
    echo "Installing ansible-creator..."
    pip install ansible-creator
fi

# Create an Ansible collection
ansible-creator init collection "$COLLECTION_NAME" || exit 1

pwd

ls -lrt

# Initialize a new Git repository for the collection
mkdir "$COLLECTION_NAME" || exit 1
cd "$COLLECTION_NAME" || exit 1
git add .

# Move back to the root directory
cd - || exit 1

# Add the collection repo to .gitignore
echo "$COLLECTION_DIR" >> .gitignore

echo "Collection $COLLECTION_NAME has been created and added to .gitignore"