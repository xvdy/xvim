if !has("python") && !has("python3")
    echomsg "decoder need python support!"
endif

let  pyEOF = "python << EOF"
if !has("python")
    let  pyEOF = "python3 << EOF"
endif

exec pyEOF

import vim
import sys
import json
from collections import OrderedDict

def decode_unicode():
	l = vim.current.line
	if sys.version_info >= (3, 0):
		s = l.encode().decode('utf-8')
	else:
		if "'" in l:
			s = eval('u"{}"'.format(l))
		else:
			s = eval("u'{}'".format(l))


	line_num = vim.current.window.cursor[0]
	buffer = vim.current.buffer
	buffer.append(s, line_num)

EOF

if has("python")
    nnoremap <leader>du :python decode_unicode()<CR>
else
    nnoremap <leader>du :python3 decode_unicode()<CR>
endif
