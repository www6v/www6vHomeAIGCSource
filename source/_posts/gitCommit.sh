#!/bin/bash

git add . 
git commit -m "add"
git push origin master

hexo g && hexo d

