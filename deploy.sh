#!/bin/sh
rsync -arv --exclude='node_modules' * deploy@ragonha.me:/www/talks/js-that-lives-on
