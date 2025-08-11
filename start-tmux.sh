#!/bin/bash

if ! command -v tmux &>/dev/null; then
  echo "tmux not found."
  exit 1
fi

if ! tmux has-session -t main 2>/dev/null; then
  tmux new-session -d -s main -n zsh
  tmux new-window -t main -n cronograma
  tmux send-keys -t main:cronograma "cd unicentro && cat cronograma.txt" C-m
fi

if ! tmux has-session -t pgdev 2>/dev/null; then
  tmux new-session -d -s pgdev -n pgdev-shell
  tmux send-keys -t pgdev:pgdev-shell "cd unicentro/banco-de-dados-II && ./pgdev.sh" C-m
fi

tmux attach -t main:zsh

