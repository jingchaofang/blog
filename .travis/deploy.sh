#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_31a9436da570_key -iv $encrypted_31a9436da570_iv -in .travis/private_key.enc -out ~/.ssh/id_rsa -d
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name 'jingchaofang'
git config --global user.email jing@turingca.com
# Deploy to GitHub
hexo deploy