#!/bin/sh
tmux has-session -t bba
if [ $? != 0 ]
then
  tmux new-session -s bba -n editor -d
  tmux send-keys -t bba 'newgrp kobra' C-m
  tmux send-keys -t bba 'cd /vobs/fpga/cobra' C-m
  tmux send-keys -t bba 'ct setview ezyaohe_1' C-m
  tmux send-keys -t bba 'module add cobra/3.1' C-m
  tmux send-keys -t bba 'emacs' C-m
  tmux split-window -v -t bba
  tmux select-layout -t bba main-horizontal
  tmux send-keys -t bba:1.2 'newgrp kobra' C-m
  tmux send-keys -t bba:1.2 'cd /vobs/fpga/cobra' C-m
  tmux send-keys -t bba:1.2 'ct setview ezyaohe_1' C-m
  tmux send-keys -t bba:1.2 'module add cobra/3.1' C-m
  tmux new-window -n console -t bba
  tmux send-keys -t bba:2 'newgrp kobra' C-m
  tmux send-keys -t bba:2 'cd /vobs/fpga/cobra' C-m
  tmux send-keys -t bba:2 'ct setview ezyaohe_1' C-m
  tmux send-keys -t bba:2 'module add cobra/3.1' C-m
  tmux send-keys -t bba:2 'cd /proj/cobra/verif/ezyaohe' C-m
  tmux select-window -t bba:1
fi
tmux attach -t bba
