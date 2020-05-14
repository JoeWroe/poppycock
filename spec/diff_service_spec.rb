require "diff_service"

describe DiffService do
  
  describe "#get_diff_for_unstaged_files" do
    
    it "should obtain the complete diff" do
      command_executor = double("command_executor")
      diff_service = DiffService.new(command_executor: command_executor)

      allow(command_executor).to receive(:execute_git_command).and_return("a git diff")
      
      expect(diff_service.get_diff_for_unstaged_files()).to eq("a git diff")
    end
  end
end


# TODO:
# Diff for staged files
# Diff for new files
