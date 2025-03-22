require 'task_helpers/bash_interface'

#BashInterface.check_PID(minecraft_pid)  
#minecraft_pid = BashInterface.get_PID("java")

class MinecraftServerClass

  def self.open(*args)
    minecraft_server_class = new(*args)
    yield minecraft_server_class
    minecraft_server_class.close
  end

  def initialize
    @screen_id = ""
    @java_id = ""
    BashInterface.initialize_logger("log/minecraft.rake.log")
    
    #check if detached screen already exists!!

    @screen_id = BashInterface.screen_instance_start
  end

  def start_server
    hosting_user = Rails.application.credentials.minecraft.hosting_user
    minecraft_server_script = Rails.application.credentials.minecraft.script
    minecraft_script_directory = Rails.application.credentials.minecraft.running_directory

    command = "sudo -n -i -u " + hosting_user + " " 
    command += + minecraft_script_directory 
    command += + minecraft_server_script

    BashInterface.execute_script_in_screen(screen_id: @screen_id, command: command)
    sleep(2)
    @java_id = BashInterface.get_PID(hosting_user, "java")
  end

  def close
    BashInterface.log(source: "MinecraftServerClass: ", text: "Closing this instance of MinecraftServer!")
    BashInterface.screen_instance_stop(@screen_id)
  end

end
