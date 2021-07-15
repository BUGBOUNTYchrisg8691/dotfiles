" Bootstrap Functions - Load After
" by Chris Girvin
" Date_Created: 07-15-21
" Date_Last_Modified: 07-15-21

" bootstrap configuration before SpaceVim core loads
func! bootstrap_funcs#before() abort
  let g:github_dashboard = { "username": "bugbountychrisg8691", "password": $GH_ACC_TOK }
  let g:gista#client#default_username = "bugbountychrisg8691"
endf

" bootstrap configuration after SpaceVim core loads
func! bootstrap_funcs#after() abort
  "
endf
