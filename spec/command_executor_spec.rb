require "Open3"

require "command_executor"

describe CommandExecutor do

  before(:each) do
    @command_executor = CommandExecutor.new
  end
  
  describe "#execute_git_command" do

    context "given the status command" do

      it "returns the expexted git status output" do
        allow(Open3).to receive(:capture2).with("git", "status").and_return("git status output")
        
        expect(@command_executor.execute_git_command("status")).to eq("git status output")
      end

      it "makes a call to the Open3" do
        expect(Open3).to receive(:capture2).with("git", "status")

        @command_executor.execute_git_command("status")
      end
    end

    context "given the diff command" do

      it "returns the expected git diff output" do
        allow(Open3).to receive(:capture2).with("git", "diff").and_return("git diff output")

        expect(@command_executor.execute_git_command("diff")).to eq("git diff output")
      end

      it "it makes a call to Open3, passing 'git diff'" do
        expect(Open3).to receive(:capture2).with("git", "diff")

        @command_executor.execute_git_command("diff")
      end
    end
  end
end

