desc "Initializes the server using host port and ip stored in encrypted credentials"

task "start_closed" => :environment do
  host = Rails.application.credentials.host
  start_command = "rails server -p " + host[:port_closed] + " -b " + host[:ip]
  system start_command
end

task "start_open" => :environment do
  host = Rails.application.credentials.host
  start_command = "rails server -p " + host[:port_open] + " -b " + host[:ip]
  system start_command
end