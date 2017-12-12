#!/usr/bin/env bash
rm -rf .deploy_aliyun/*
cp -r ./.deploy/* .deploy_aliyun/
cp -r ./public/* .deploy_aliyun/
git add .
git commit -m 'self publish finish'
git push --recurse-submodules=on-demand