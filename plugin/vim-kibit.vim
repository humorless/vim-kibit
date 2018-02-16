let g:kibit_required = 0

function! s:RequireKibit()
  let l:cmd = "(require 'kibit.check)"
  try
    silent! call fireplace#session_eval(l:cmd)
      return 1
    catch /^Clojure: class java.io.FileNotFoundException*/
      echom "vim-kibit: Could not locate kibit/core__init.class"
      return 0
    catch /^Fireplace:.*/
      echom v:exception
      return 0
  endtry
endfunction

function! s:KibitCommand(CurrentFileName)
  return '(print (kibit.check/check-file "' . a:CurrentFileName .'"))'
endfunction

function! s:KibitCheck()
  let g:kibit_required = s:RequireKibit()
    " If kibit.check has already been required, or was successfully imported
    " above
  let l:CurrentFileName = expand("%")
  if g:kibit_required
	 try
	   call fireplace#session_eval(s:KibitCommand(l:CurrentFileName))
		 return 1
	   catch /^Clojure: */
		 echom "kibit check-file failed"
		 return 0
	   catch /^Fireplace:.*/
		 echom v:exception
		 return 0
	  endtry
  endif
endfunction

command! KibitCheck call s:KibitCheck()
