EDITOR='emacsclient -c'
ALTERNATE_EDITOR='mg'

function cvs_up {
	cvs -q up -Pd -A
}
function cvs_diff {
	cvs -q diff -uNp $1
}
function cvs_revert {
	cvs update -C $1
}

function irc {
    ssh eurydome -t "tmux a -d -t irc"
}

export EDITOR ALTERNATE_EDITOR
