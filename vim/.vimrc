runtime syntax/css.vim

"Keyboard hotkey
"Tab - автокомплит

"Ctrl-C
"Ctrl-V
"Ctrl-X

"Ctrl-T
"Ctrl-W

"F2 - сохранение
"F4 - переключение фолдинга
"F5 - запуск
"F6 - просмотр списка буферов
"F7 - предыдующий буфер
"F8 - следующий буфер
"F9 - удалить буфер
"F10 -
"F12 - taglist



" схема
colors liquidcarbon

" убираем меню тулбары скроллы
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions-=e

" кол-во символов пробелов, которые будут заменять \t
set tabstop=4
set shiftwidth=4

" Включаем умные отспупы ( например, автоотступ после {)
set smarttab
set expandtab
set smartindent

" автозамена по умолчанию
set et

" попросим Vim переносить длинные строки
set wrap

" включим автоотступы для новых строк
set ai

" включим отступы в стиле Си
set cin

" поиск и подсветка результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

" ленивая перерисовка экрана при выполнении скриптов
set lz

" Перехват мышки
set mouse=a

" перечитывать изменённые файлы автоматически
set autoread

" показывать имя буфера в заголовке терминала
set title

" хранить больше истории команд
set history=128

" хранить историю изменений числом N
set undolevels=2048

" сколько строк внизу и вверху экрана показывать при скроллинге
set scrolloff=3

" Строка состояния
set ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
"set rulerformat=%{&ff}\ %(%l,%c,%{&fileencoding}\ %p%%%)
set rulerformat=%30(%{&ff}\ %{&fileencoding}\ %l,%c\ %P%)


" Подсветка 85 столбца
set colorcolumn=100
highlight ColorColumn guibg=Gray14


" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile

" Кодировка файлов по умолчанию
"set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le
set termencoding=utf-8
set fileformat=unix
"set fileformats=unix,dos

" Включаем несовместимость настроек Vi
set nocompatible

" Показывать незавершённые команды в статусбаре
set showcmd

" Не выгружать буфер, когда переключаемся на другой
set hidden

" Сделать строку команд высотой в одну строку
set ch=1

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Использовать больше цветов в терминале
set t_Co=256

" Включает отображение номеров строк
set number

" Подсветка текущей строки
set cursorline

" подсветка синтакиса
syntax on

" фолдинг
set foldenable
set foldcolumn=1

" Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

" Python, подсветка всего
let python_highlight_all = 1

" Автокомплит
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t


set completeopt-=preview
set completeopt+=longest
set mps-=[:]


" Настройка сохранения сессий
"set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions,options
set sessionoptions=blank,buffers,folds,help,tabpages,winsize,localoptions,options,resize,winpos

" Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот
set sessionoptions+=unix,slash



"=========Plugins=========
" TagList
" Настройки для Tlist (показвать только текущий файл в окне навигации по  коду)
let g:Tlist_Show_One_File = 1







"========Win/Linux========
if has('gui')
    if has('win32')
        " Пытаемся занять максимально большое пространство на экране.
        autocmd GUIEnter * :set lines=99999 columns=99999

        " Устанавливаем шрифт
        set guifont=Consolas:h10:cRUSSIAN

        " Показываем табы в начале строки точками
        set listchars=tab:·
        set list
    elseif has('gui_gtk2')
        " Кодировка всего
        set encoding=utf-8

        " Показываем табы в начале строки точками
        set listchars=tab:··
        set list
    endif
endif








"=========Hotkeys=========
" Ctrl-X, Ctrl-C, Ctrl-V
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>i
imap <C-C> <C-O>vgG
vmap <C-C> "*y<Esc>i
nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
imap <C-V> x<Esc>\\paste\\"_s
vmap <C-V> "-cx<Esc>\\paste\\"_x

" Открытие\закрытие новой вкладки по CTRL+T и CTRL+W
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>a
nmap <C-w> :tabclose<CR>
imap <C-w> <Esc>:tabclose<CR>

" F2 - сохранить файл
nmap <F2> :w!<CR>a
imap <F2> <Esc>:w!<CR>a
vmap <F2> <Esc>:w!<CR>a

" F3 - просмотр ошибок
"nmap <F3> :copen<cr>
"vmap <F3> <esc>:copen<cr>
"imap <F3> <esc>:copen<cr>

" переключение метода фолдинга
map <F4>  <esc>:call SwitchFold()<cr>

" F6 - просмотр списка буферов
nmap <F6> <Esc>:BufExplorer<cr>
vmap <F6> <esc>:BufExplorer<cr>
imap <F6> <esc><esc>:BufExplorer<cr>

" F7 - предыдущий буфер
map <F7> :bp<cr>
vmap <F7> <esc>:bp<cr>i
imap <F7> <esc>:bp<cr>i

" F8 - следующий буфер
map <F8> :bn<cr>
vmap <F8> <esc>:bn<cr>i
imap <F8> <esc>:bn<cr>i

" F9 - удалить буфер
map <F9> :bd<cr>
vmap <F9> <esc>:bd<cr>
imap <F9> <esc>:bd<cr>

" F12 - показать окно Taglist
map <F12> :TlistToggle<cr>
vmap <F12> <esc>:TlistToggle<cr>
imap <F12> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
"map <F12> :Ex<cr>
"vmap <F12> <esc>:Ex<cr>i
"imap <F12> <esc>:Ex<cr>i




" Показываем все полезные опции автокомплита сразу
imap <C-Space> <c-r>=InsertTabWrapper()<cr>


"" Переключение табов (вкладок) (rxvt-style)
map <S-left> :tabprevious<cr>
nmap <S-left> :tabprevious<cr>
imap <S-left> <ESC>:tabprevious<cr>i
map <S-right> :tabnext<cr>
nmap <S-right> :tabnext<cr>
imap <S-right> <ESC>:tabnext<cr>i






"=========Autocmd=========
autocmd FileType c,cc,cpp,h,hpp imap #m int main(int argc, char * argv) {
autocmd FileType c,cc,cpp,h,hpp imap #d #define

autocmd BufEnter *.coffee set filetype=coffee
autocmd BufEnter *.jade set filetype=jade
autocmd BufEnter *.less set filetype=less

"autocmd Syntax less     runtime! syntax/less.vim
"autocmd Syntax jade     runtime! syntax/jade.vim
"autocmd Syntax py       runtime! syntax/python.vim
"autocmd Syntax java     runtime! syntax/java.vim
"autocmd Syntax coffee   runtime! syntax/coffee.vim

" Удалять пустые пробелы на концах строк при открытии файла
autocmd BufEnter *.* :call RemoveTrailingSpaces()

" Подсвечивает все слова, которые совпадают со словом под курсором.
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


" запус shell скриптов
autocmd FileType sh,bash map <F5> :!bash %<CR>

autocmd FileType cs map <F5> :!gmcs % && mono %<.exe<CR>


" Настройка omnicomletion для python, js, html, css
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set "omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufReadPost *.jade set filetype=jade



" Автоматическое сохранение сессии
autocmd VimLeavePre * silent mksession! $HOME/.Session

" Автоматическая загрузка последней сохранённой сессии
autocmd VimEnter * :so $HOME/.Session



"========Functions========
" Переключение фолдинга
function SwitchFold()
    if &foldmethod=="marker"
        set foldmethod=syntax
        return
    endif
    if &foldmethod=="syntax"
        set foldmethod=indent
        return
    endif
    if &foldmethod=="indent"
        set foldmethod=manual
        return
    endif
    if &foldmethod=="manual"
        set foldmethod=marker
        return
    endif
endfunction




" Авто комплит по табу
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\"
    else
        return "\<c-p>"
    endif
endfunction



" Удалить пробелы в конце строк
function! RemoveTrailingSpaces()
   normal! mzHmy
   execute '%s:\s\+$::ge'
   normal! 'yzt`z
endfunction










