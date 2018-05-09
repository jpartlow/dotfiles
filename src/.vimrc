execute pathogen#infect()
let g:sh_fold_enabled=1
syntax on
filetype plugin indent on

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set secure
"set exrc
set path+=
set path+=src
set path+=lib
set path+=spec
"set spell spelllang=en_us

"set t_Co=256
"colorscheme solarized

" spec execution shortcuts
"
" fiddling with a better way of doing this
"function! Foo()
"    normal $
"    search('it "\\|it {\\|it do\\|its(')
"    normal y:nohlsearch
"endfunction
"call Foo()

" RSpec 2 uses -l <lineno> file
"map <F5> $? it "\\|it '\\|it {\\|it do\\|its(\\|it_should<cr>:nohlsearch<cr>:call setreg("a", line("."))<cr>:<C-f>i!clear; bundle exec rspec -l<esc>"apA %<cr>
"imap <F5> <esc>$? it "\\|it '\\|it {\\|it do\\|its(\\|it_should<cr>:nohlsearch<cr>:call setreg("a", line("."))<cr>:<C-f>i!clear; bundle exec rspec -l<esc>"apA %<cr>
" RSpec 3 uses file:<lineno>
map <F5> $? it "\\|it '\\|it {\\|it do\\|its(\\|it_should<cr>:nohlsearch<cr>:call setreg("a", line("."))<cr>:<C-f>i!clear; bundle exec rspec %:\<esc>"apA<cr>
imap <F5> <esc>$? it "\\|it '\\|it {\\|it do\\|its(\\|it_should<cr>:nohlsearch<cr>:call setreg("a", line("."))<cr>:<C-f>i!clear; bundle exec rspec %:\<esc>"apA<cr>
map <F6> :!clear; bundle exec rspec %<cr>
imap <F6> <esc>:!clear; bundle exec rspec %<cr>
