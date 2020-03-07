"""" Neovim specific configs
if has("nvim")
  Plug 'kassio/neoterm'
  let g:neoterm_default_mod="botright"
  au TermOpen * tnoremap <buffer> <leader><Esc> <c-\><c-n>
  " au FileType fzf tunmap <buffer> <Esc>
endif
