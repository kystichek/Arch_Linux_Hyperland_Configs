#!/bin/bash
sensors | grep -e "temp" | awk '{print $2}'
