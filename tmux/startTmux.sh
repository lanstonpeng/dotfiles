#!/bin/zsh

SESSION="mySession"
tmux_init(){
    tmux -2 new-session -d -s $SESSION -n "misc"
    tmux send-key "fuckgfw" C-m
    tmux split-window -h -p 80
    tmux select-pane -t $SESSION:1.1
    tmux split-window -v -p 60
    tmux new-window -t $SESSION:2 -n "devwork"
    tmux send-key "cd ~/baidu_dev/" C-m
    tmux new-window -t $SESSION:3 -n "writing"
    tmux send-key "cd ~/Desktop/myadmin" C-m
    tmux split-window -h -p 70
    tmux send-key "cd ~/Desktop/myadmin/lab/algorithm" C-m
    tmux -2 attach-session -t $SESSION
}

test -z "$TMUX" && tmux_init
