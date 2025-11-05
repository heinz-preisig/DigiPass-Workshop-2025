#!/bin/bash


git add . > push.log
git commit . -m"auto commit"
git push --all -u >> push.log

