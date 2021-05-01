# Required

* Docker
* Docker engine need 4GO (RAM).

# Installation

* Run `docker-compose build` (build is low, ~ 300 seconds)
* Run `docker-compose up -d`
* Wait `20 seconds`
* Run `docker-compose run web rails db:create` to create postgres database
* Go to app in `localhost:3000`

# Add fake data

* Run `docker-compose exec web rails create_data_elasticsearch:process` (Run rake task => /lib/task)
* Index is `index01`
* Test if data is on elasticsearch, go to `localhost:3000/es`

# Run APM

* Go to Elastic web interface in `http://localhost:5601/app/home#/tutorial/apm` :
  * In APM Server, check APM Server status
  * In APM Agents, Load Kibana objects
  * Launch APM
