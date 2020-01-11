" Vim syntax file
" Language: Xilinx bif file
" Maintainer: Liam Beguin
" Latest Revision: 24 July 2018

if exists("b:current_syntax")
	finish
endif

" Regular list of TODO tags
syn keyword bifTodo contained TODO FIXME XXX NOTE

" COMMON BIT ATTRIBUTES (see: `bootgen -bif_help`)
syn keyword bifAttr contained nextgroup=bifOperator
	\ init
	\ aeskeyfile
	\ ppkfile
	\ pskfile
	\ spkfile
	\ sskfile
	\ spksignature
	\ headersignature
	\ bootimage
	\
	\ pmufw_image
	\ auth_params
	\ keysrc_encryption
	\ boot_device
	\ fsbl_config
	\ split
	\ puf_file
	\ bhsignature
	\ familykey
	\
	\ bootloader
	\ encryption
	\ authentication
	\ checksum
	\ presign
	\ udf_data
	\ xip_mode
	\ partition_owner
	\ alignment
	\ offset
	\ reserve
	\ load
	\ startup
	\
	\ destination_cpu
	\ destination_device
	\ trustzone
	\ early_handoff
	\ hivec
	\ exception_level
	\ blocks

syn match bifOperator contained nextgroup=bifValue
	\ "[=,]"

syn match bifValue contained "a53-[0-3]"
syn match bifValue contained "el-[0-3]"
syn keyword bifValue contained
	\ md5
	\ sha3

" Match image name
syn match bifName "\w\+:\@=" nextgroup=bifDescBlock

" Match all C style comments
syn match bifComment "//.*$" contains=bifTodo
syn region bifComment start="/\*" end="\*/" contains=bifTodo

" Match all value fields
syn region bifAttrBlock start="\["ms=s+1 end="\]"me=e-1 contains=bifAttr,bifOperator,bifValue

syn region bifDescBlock start="{" end="}" fold transparent contains=bifAttrBlock

let b:current_syntax = "bif"

" Highlight
hi def link bifName		Identifier
hi def link bifTodo		Todo
hi def link bifAttrBlock	Error
hi def link bifAttr		Special
hi def link bifOperator		Special
hi def link bifValue		Constant
hi def link bifComment		Comment

