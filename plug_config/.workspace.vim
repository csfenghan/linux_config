let g:ale_linters = {
                        \'c':['gcc','cppcheck'],
                        \'cpp':['g++','cppcheck'],
			\'python':['pylint'],
                \}
let g:ale_c_cc_options = '-std=gnu99 -Wall'
let g:ale_cpp_cc_options = '-Wall -std=c++11'
let g:ale_python_pylint_options= '--errors-only --extension-pkg-whitelist=PyQt5,cv2'

