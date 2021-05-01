# Required

* Docker
* Docker engine need 4GO (RAM).

# Installation

* Run `docker-compose build` (build is low, ~ 300 seconds)
* Run `docker-compose up -d` (wait 1 minute after)
* Check if containers are running with `docker ps` (container postgres & web)
* Run `docker-compose run web rails db:create` to create postgres database
* Go to Elastic web interface in `http://localhost:5601/app/home#/tutorial/apm` :
  * In APM Server, check APM Server status
  * In APM Agents, Load Kibana objects
  * Launch APM

# Fake data

* Run `docker-compose exec web rails create_data_elasticsearch:process` (Run rake task => /lib/task)
