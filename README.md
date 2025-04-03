# README
## OVERVIEW
#### Serves as a community relations manager, something like a customer relation manager but oriented towards other social or academic communities, rather than corporate

## GENERAL INFORMATION
* Versions
  * Ruby 3.3.4
  * Rails 8.0.2
  * Fedora 41 (shouldn't be relevant, except possibly for some of the miscellaneous experimentation noted below)
* setup
  * Add below lines in 'rails credentials:edit' (as appropriate)
```
developer_access:
  - "<ip of developer one>"
  - "<ip of developer two>"

host:
  ip: "<ip of host interface >"
  port: "<port of host interface >"
```

## ORGANIZATION
* Authentication | Controllers, Models, Views
  * Handles users, passwords, & sessions
* FALO (Fuck Around and Learn) | Controllers, Models, Views
  * publically accessible, sure
* /lib/tasks
  * start.rake
    * allows server to be started w/ ip, port from credentials.yml.enc using 'rails start_open' or 'rails start_closed'

## MISCELLANEOUS NOTES
* For my own convenience, I've bundled a few other things in here
  * Using Faker to seed mock data
    * I used gmail's plus addressing to generate mock users with valid e-mails; I set the base e-mail and a password for those users in rails credentials:
```
mock_seeding:
  email_base: "<part before @>"
  email_suffix: "@gmaail.com"
  password: "<password>" 
```
    * Mock data attached to mock users by ID
    * Mock User ID's stored in /db/seeds/mock_data.yml
  * Experimentation w/ bash/fedora interfacing via a minecraft server; 
    * NOTE: currently, not fully functional; I think there is still a permissions or configuration issue; while the server appears to fully boot, I haven't been able to successfully log a client into the server
    * also included in the credentials.enc file to support this:
      * server start script filename
      * start script absolute directory
      * directory for backup files to be placed
      * username to run the server under
      * password for user running rails server, to enable running minecraft under a separate account
    * automatically running under a seperate account w/out requiring a su login requires modifying sudoers file
      * in Fedora, sudo visudo
``` 
rails_username ALL=(minecraft_username) NOPASSWD: /bin/bash -c <server script> 
```

## TO DOS
* SECURITY
  * Harden Fedora
    * https://github.com/imthenachoman/How-To-Secure-A-Linux-Server
  * Shifting to use something other than pid's for url's, or using uui7 for record url's (resolved by using authentication, to a degree?)
  * Implement shared ownership, viewing of records?

* ORGANIZATION
  * Move js script to prevent file upload via ActionText/Trix from /views/entities/edit.html.erb to somewhere more appropriate
  * Organize lib better, particularly faker supporting classes

* TESTING
  * Check failed test
    * Yes, injection warning, but how the hell am I supposed to use variables from credentials w/out triggering the injection failures??

* MISCELLANEOUS
  * Displaying static/markdown pages
    * https://rollen.io/blog/markdown-rails/
  * ~~Mock data: store user e-mails in /db/seeds/mock_data.yml~~
  * Implement guest account for demoing
  * IMPLEMENT STORIES/JOURNAL, != EVENTS?? OR STICK THEM IN EVENTS??

## BUGS
* When attempting to manually access specific record that doesn't belong to a user....