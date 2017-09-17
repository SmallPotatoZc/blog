#!/usr/bin/env bash
rm -rf ./.deploy_self/*
cp -r ./.deploy/* ./.deploy_self/
cp -r ./public/* ./.deploy_self/
git add .
git commit -m 'self publish finish'
git push