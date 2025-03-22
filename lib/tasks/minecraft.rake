require 'task_helpers/bash_interface'
require 'task_helpers/minecraft_server_class'

desc "file for testing custom rake tasks"

task "minecraft" => :environment do
  #BashInterface.initialize_logger("log/minecraft.rake.log")

  minecraft_server = MinecraftServerClass.new()

  minecraft_server.start_server

  begin
  rescue
  ensure
    #AT THIS POINT, DON'T CLOSE THE SCREEN. SAVE THAT FOR LATER!
    #minecraft_server.close
  end
end