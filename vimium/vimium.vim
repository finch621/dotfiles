# Insert your preferred key mappings here.

## translate <esc> key
translate <c-c> <c-[>

## no new blank tab always use 'o' or 'O' to open new tab
unmap t

## vimlike half scrolls
unmap d
map <c-d> scrollPageDown
unmap u
map <c-u> scrollPageUp

## myvimrc like config
unmap K
map <c-k> nextTab
unmap J
map <c-j> previousTab

## vimlike last mark/tab
unmap ^
map ` visitPreviousTab

## close tabs on right :)
map $ closeTabsOnRight

## ctrl.p like setup
unmap T
map ,f Vomnibar.activateTabSelection
