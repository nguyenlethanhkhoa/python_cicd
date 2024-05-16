#!/bin/bash

echo "------------------ LL COMMAND ------------------------------"
ls -l

echo "------------------ BLACK COMMAND ------------------------------"
/venv/bin/black . --check --diff