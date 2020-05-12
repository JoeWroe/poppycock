require "Open3"
require "command_executor"

describe CommandExecutor do
  
  describe ".execute_git_command" do

    context "given the status command" do

      it "returns the expexted git status output" do
        command_executor = CommandExecutor.new

        allow(Open3).to receive(:capture2).with("git", "status").and_return("git status output")
        
        expect(command_executor.execute_git_command("status")).to eq("git status output")
      end

      it "makes a call to the Open3" do
        command_executor = CommandExecutor.new

        expect(Open3).to receive(:capture2).with("git", "status")

        command_executor.execute_git_command("status")
      end
    end
  end
end

