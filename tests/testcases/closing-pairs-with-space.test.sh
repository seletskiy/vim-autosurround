vim-tests:type "$_vim_session" \
    "i" \
    "f{" "enter" "a[b.c] = d" "escape" \
    "0f]" "i(x" "escape"

tests:eval tmux:cat-screen "$_vim_session"

vim-tests:write-file "$_vim_session" "result"

tests:assert-no-diff "result" <<EXPECTED
f{
	a[b.c(x)] = d
}
EXPECTED
