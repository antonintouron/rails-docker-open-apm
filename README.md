![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png)
![](https://user.oc-static.com/upload/2017/10/10/15076639807937_Elasticsearch-Logo-Color-V.jpg.png)
![](https://blog.engineering.publicissapient.fr/wp-content/uploads/2016/04/docker.png)

Rails-docker-open-apm is a ruby application with docker using a classical database `postgresql` but also `elasticsearch` for the noSQL. `Kibana` is integrated to use the `OPEN APM` features.  

The docker-compose file :

* `postgres` container
* `web` container
* `apm-server` container
* `elasticsearch` container
* `kibana` container

# Required

* Docker
* Docker engine need 4GO (RAM).

# Installation

* Run `docker-compose build` (build is low, ~ 300 seconds)
* Run `docker-compose up -d`
* Wait `20 seconds` (rails need time to start)
* Run `docker-compose run web rails db:create` to create postgresql database
* Go to app in `localhost:3000` => Yeah it's rails !

# Add fake data

* Run `docker-compose exec web rails create_data_elasticsearch:process` (Run rake task => /lib/task)
* Index is `index01`
* Test if data is on elasticsearch, go to `localhost:3000/es` (if you are error with webpack run `docker-compose run web rails webpacker:install` and override configuration)

# Run APM

* Go to kibana web interface in `http://localhost:5601`.
* You can explore but to see the elasticsearch logs :
  * Go to `http://localhost:5601/app/home#/tutorial/apm`
  * `Warning there is nothing to install !`
  * In `APM Server`, just check APM Server status.
  * In `APM Agents`, just Load Kibana objects
  * And click to `Launch APM`
