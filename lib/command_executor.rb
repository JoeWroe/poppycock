require 'Open3'

class CommandExecutor

  def execute_git_command(command)
    Open3.capture2("git", command)
  end
end
