require './my_utils.rb'

CHECKER_NAME = "checker"
CHECKER_NAME_E = "./checker"
CHECKER_NAME_O = "checker.o"

COMPILATION_LOG_FILE = ARGV[0]
EXECUTION_LOG_FILE = ARGV[1]
SOLVE_STATUS_FILE = ARGV[2]

checker_comp = "make -f CheckerMakefile"

cmd_compilation1 = "make"
cmd_compilation2 = "gcc -o " + CHECKER_NAME + " " + CHECKER_NAME_O + " -L. -lsolution"
cmd_execution = "LD_LIBRARY_PATH=$(pwd) " + CHECKER_NAME_E

solve_status = 0

exec_cmd(checker_comp, "tmp")
tmp_stdout, tmp_val = exec_cmd(cmd_compilation1, COMPILATION_LOG_FILE)
tmp_stdout2, tmp_val2 = exec_cmd(cmd_compilation2, COMPILATION_LOG_FILE)
if tmp_val.exitstatus == 0 and tmp_val2.exitstatus == 0
  printCompilationSuccess(COMPILATION_LOG_FILE)		
  sol_stdout, ret_val = exec_cmd(cmd_execution, EXECUTION_LOG_FILE)
  solve_status = (ret_val.exitstatus == 0 ) ? 1: 0

else
  printCompilationFail(COMPILATION_LOG_FILE)		
  appendFile(EXECUTION_LOG_FILE, "")
end

puts "trying to write solve_status"
appendFile(SOLVE_STATUS_FILE, solve_status)
