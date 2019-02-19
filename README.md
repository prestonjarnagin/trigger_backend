# Trigger Backend
[![Maintainability](https://api.codeclimate.com/v1/badges/e20e946107d86caff2e0/maintainability)](https://codeclimate.com/github/prestonjarnagin/trigger_backend/maintainability)
[![CircleCI](https://circleci.com/gh/prestonjarnagin/trigger_backend.svg?style=svg)](https://circleci.com/gh/prestonjarnagin/trigger_backend)  
This is the backend portion Trigger - a capstone project at Turing School of Software and Design. It's designed to interface with the [Trigger front-end application](https://github.com/Diazblack/trigger)

- A production version of this application can be found at http://herokuapp.com/trigger-backend.
- A staging environment can be found at http://herokuapp.com/trigger-backend-staging
- API endpoints are nested under `/api/v1`

#### Usage
After cloning this repo...
- Install dependancies with `$ bundle`
- Run the test suite using rspec with `$ bundle exec rspec`
- Run the server locally with `$ rails s`. The server runs on port 3000 by default, at `http://localhost:3000`

#### SCHEMA DESIGN
![alt text](https://raw.githubusercontent.com/prestonjarnagin/trigger_backend/master/schema_design.png)

#### Endpoints
Endpoints are documented in OpenAPI 3.0 and can be found in the `openapi.yaml` file in this projects root directory

#### Built With
- Ruby & Rails
- RSpec
