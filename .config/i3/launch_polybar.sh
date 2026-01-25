#!/usr/bin/env bash

if type "randr"; then
  for m in $(xandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi

