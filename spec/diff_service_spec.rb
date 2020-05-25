require "diff_service"

describe DiffService do

  describe "#complete_diff" do
     
    it "should return the complete diff" do
      command_executor = double("command_executor")
      allow(command_executor).to receive(:execute_git_command).and_return("a git diff")

      diff_service = DiffService.new(command_executor: command_executor)
      diff_service.get_diff_for_unstaged_files()

      expect(diff_service.complete_diff).to eq("a git diff")
    end

    it "should error if complete diff has not been set" do
      command_executor = double("command_executor")

      diff_service = DiffService.new(command_executor: command_executor)

      expect { diff_service.complete_diff }.to raise_error(DiffNotSetError)
    end
  end
  
  describe "#get_diff_for_unstaged_files" do
    
    it "should be able to obtain the complete diff" do
      command_executor = double("command_executor")
      allow(command_executor).to receive(:execute_git_command).and_return("a git diff")

      diff_service = DiffService.new(command_executor: command_executor)
      expect(diff_service.get_diff_for_unstaged_files()).to eq("a git diff")
    end
  end
end


# TODO:
# Diff for staged files
# Diff for new files
