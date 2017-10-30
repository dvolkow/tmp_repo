require './my_utils.rb'

COMPILATION_LOG_FILE = ARGV[0]
EXECUTION_LOG_FILE = ARGV[1]
SOLVE_STATUS_FILE = ARGV[2]
TASK_ID = ARGV[3]


appendFile(EXECUTION_LOG_FILE, "Task with task_id=#{TASK_ID} does not exist.")
appendFile(COMPILATION_LOG_FILE, "")
appendFile(SOLVE_STATUS_FILE, "0")
