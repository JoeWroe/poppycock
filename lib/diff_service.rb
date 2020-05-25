class DiffService

  attr_reader :complete_diff

  def initialize(command_executor:)
    @command_executor = command_executor
    @complete_diff = ""
  end

  def get_diff_for_unstaged_files
    @complete_diff = @command_executor.execute_git_command("diff")
  end
end
