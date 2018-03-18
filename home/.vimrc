augroup filetype
  au! BufRead,BufNewFile *.boink setfiletype proto
augroup end

:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
:autocmd BufWritePre * :%s/\s\+$//e
:set number

filetype plugin on
let python_highlight_all = 1
let python_version_2 = 1
:syntax on

:set expandtab
:set tabstop=4
:set shiftwidth=4
:set colorcolumn=80
