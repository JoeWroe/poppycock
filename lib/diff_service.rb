class DiffService

  def initialize(command_executor:)
    @command_executor = command_executor
    @complete_diff = ""
  end

  def complete_diff
    raise DiffNotSetError.new unless @complete_diff.length > 0
    @complete_diff
  end

  def get_diff_for_unstaged_files
    @complete_diff = @command_executor.execute_git_command("diff")
  end
end

# Errors

class DiffNotSetError < StandardError

  def initialize
    msg = "The #complete_diff is currently empty, please obtain the complete diff first. To do this, run #get_diff_for_unstaged_files."
  end
end
