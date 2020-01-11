" Vim syntax file
" Language: Xilinx bif file
" Maintainer: Liam Beguin
" Latest Revision: 24 July 2018

if exists("b:current_syntax")
	finish
endif

" Regular list of TODO tags
syn keyword bifTodo contained TODO FIXME XXX NOTE

" Here is a selection of attributes often used
syn keyword bifAttr nextgroup=bifValue skipwhite
syn keyword bifAttr
	\ bootloader
	\ checksum
	\ load
	\ offset
	\ reserve

" Match image name
syn match bifName "\w\+:\@="

" Match all C style comments
syn match bifComment "//.*$" contains=bifTodo
syn region bifComment start="/\*" end="\*/" contains=bifTodo

" Match all value fields
syn region bifValues start="\[" end="\]" contains=bifValue
syn match bifValue "=\@<=\w\+" contained


syn region bifDescBlock start="{" end="}" fold transparent contains=bifAttr,bifComment,bifValue

let b:current_syntax = "bif"

" Highlight
hi def link bifName Normal
hi def link bifTodo Todo
hi def link bifAttr Statement
hi def link bifValue Constant
hi def link bifComment Comment

