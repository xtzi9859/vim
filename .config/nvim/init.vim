source /home/nao/.config/nvim/dein.vim

imap jk <Plug>(skkeleton-toggle)
cmap jk <Plug>(skkeleton-toggle)
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

set number
set helplang=ja
set tabstop=4
set list listchars=eol:↓,tab:>-,trail:+

call skkeleton#config({'globalDictionaries':['~/.config/nvim/SKK-JISYO.L', '~/.config/nvim/SKK-JISYO.station']})

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'file',
 \ 'skkeleton'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {
 \   'mark': 'Around'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ },
 \ 'skkeleton': {
 \   'mark': 'skk',
 \   'matchers': ['skkeleton'],
 \   'sorters': [],
 \   'isVolatile': v:true
 \ }
 \ })
call skkeleton#config({'completionRankFile': '~/.skkeleton/rank.json'})
call ddc#enable()

lua<<EOF
vim.api.nvim_set_hl(0, "SkkeletonIndicatorEiji",
{ fg = "#CA7027", bg = "#374F38", bold = true })
vim.api.nvim_set_hl(0, "SkkeletonIndicatorHira",
{ fg = "#2BC1B4", bg = "#3f7bca",bold = true })
vim.api.nvim_set_hl(0, "SkkeletonIndicatorKata",
{ fg = "#D6C199", bg = "#24415D", bold = true })
vim.api.nvim_set_hl(0, "SkkeletonIndicatorHankata",
{ fg = "#842E36", bg = "#D0B089", bold = true })
vim.api.nvim_set_hl(0, "SkkeletonIndicatorZenkaku",
{ fg = "#fcf2e0", bg = "#2b5f32", bold = true })
require'skkeleton_indicator'.setup{}
EOF
