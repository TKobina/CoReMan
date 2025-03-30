require 'open3'
require 'securerandom'

module BashInterface
  def self.true?(object)
    return object == 0 ? true : false  
  end

  def self.initialize_logger(task_log_file)
    @logger = Logger.new(task_log_file)
    @logger.info("Minecraft log initialized!")
  end

  def self.log(source: "BashInterface: ", text: "")
      @logger.info source + text
  end

  def self.success?(status:, value_true: true, value_false: "")
    status = true?(status.to_i)
    value = status ? value_true : value_false
    text = status ? "#{caller[0]} returned #{value_true}" : "#{caller[0]} returned #{value_false}"

    log(text: text)

    value
  end

  def self.get_PID(user, process)
    stdout, status = Open3.capture2("pgrep -nu #{user} #{process}")

    success?(status: status, value_true: stdout, value_false: -1)
  end

  def self.check_PID(pid)
    stdout, status = Open3.capture2("ps -p #{pid} > /dev/null 2>&1")
    success?(status: status, value_true: true, value_false: false)
  end

  def self.kill_pid(pid)
    stdout, status = Open3.capture2("kill #{pid}")
    success?(status: status, value_false: "#{caller[0]} failed to kill #{pid}")
  end

  def self.screen_instance_start
    screen_id = SecureRandom.hex
    stdout, status = Open3.capture2("screen -S \"#{screen_id}\" -d -m")
    success?(status: status, value_true: screen_id, value_false: -1)
  end

  def self.execute_script_in_screen(screen_id:, command:)
    stdout, status = Open3.capture2(" screen -S \"#{screen_id}\" -p 0 -X stuff \"#{command}^M\"")
    success?(status: status)
  end

  def self.screen_instance_stop(screen_id)
    stdout, status = Open3.capture2("screen -X -S \"#{screen_id}\" -X quit")
    success?(status: status, value_false: false)
  end
end
