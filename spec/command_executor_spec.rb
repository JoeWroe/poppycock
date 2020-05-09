require 'command_executor'

describe CommandExecutor do
  
  describe ".git_command" do

    context "given a common git command" do

      it "returns expexted git output" do
        command_executor = CommandExecutor.new
        
        expect(command_executor.git_command("status")).to eq("git status output")
      end
    end
  end
end
