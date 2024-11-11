#!/bin/bash

# Variables
COLLECTION_NAME=$1
COLLECTION_DIR="example/$COLLECTION_NAME"

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
cd "$COLLECTION_DIR" || exit 1
git init
git add .
git commit -m "Initial commit for $COLLECTION_NAME collection"

# Move back to the root directory
cd - || exit 1

# Add the collection repo to .gitignore
echo "$COLLECTION_DIR" >> .gitignore

echo "Collection $COLLECTION_NAME has been created, initialized as a new git repo, and added to .gitignore"