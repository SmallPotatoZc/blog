#!/usr/bin/env bash
rm -rf .deploy_aliyun/*
cp -r ./.deploy/* .deploy_aliyun/
cp -r ./public/* .deploy_aliyun/
git add .
git commit -m 'self publish finish'
cd .deploy_aliyun && git add .
cd .deploy_aliyun && git commit -m 'self publish finish'
cd .. && git push --recurse-submodules=on-demand