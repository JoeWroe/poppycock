require 'command_executor'

describe CommandExecutor do
  
  describe ".execute_git_command" do

    context "given the git status command" do

      it "returns the expexted git status output" do
        command_executor = CommandExecutor.new

        allow(command_executor).to receive(:`).and_return("git status output")
        
        expect(command_executor.execute_git_command("status")).to eq("git status output")
      end

      it "makes a call to the ruby kernel" do
        command_executor = CommandExecutor.new

        expect_any_instance_of(Kernel).to receive(:`)

        command_executor.execute_git_command("status")
      end
    end
  end
end

