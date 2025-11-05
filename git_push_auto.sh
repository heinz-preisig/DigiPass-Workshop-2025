#!/bin/bash


git add . > push.log
git commit . -m"auto commit" >> push.log
git push --all -u >> push.log

