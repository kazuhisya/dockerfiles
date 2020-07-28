#!/bin/sh
time docker build -t local/redmine .
time docker build -t local/redmine:plugins -f Dockerfile.plugins .
