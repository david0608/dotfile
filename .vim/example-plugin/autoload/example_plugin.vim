func! example_plugin#example()
	echo "Hello from example."
endfunc

func! example_plugin#echo_syn()
	let s = synID(line('.'), col('.'), 1)
	echo synIDattr(s, 'name') '->' synIDattr(synIDtrans(s), 'name')
endfunc

