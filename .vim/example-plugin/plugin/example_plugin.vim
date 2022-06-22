if exists("g:loaded_example_plugin")
	finish
endif
let g:loaded_example_plugin=1

command! Example call example_plugin#example()
command! Echosyn call example_plugin#echo_syn()

