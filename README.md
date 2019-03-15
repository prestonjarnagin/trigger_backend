# Trigger Backend
[![Maintainability](https://api.codeclimate.com/v1/badges/e20e946107d86caff2e0/maintainability)](https://codeclimate.com/github/prestonjarnagin/trigger_backend/maintainability)
[![CircleCI](https://circleci.com/gh/prestonjarnagin/trigger_backend.svg?style=svg)](https://circleci.com/gh/prestonjarnagin/trigger_backend)  

This is the backend portion Trigger - a capstone project at Turing School of Software and Design. It's designed to interface with the [Trigger Front-End Application](https://github.com/Diazblack/trigger)

- This project used a Dev, Staging, Production workflow.
  - The production version of this application can be found [here](http://herokuapp.com/trigger-backend)
  - The staging environment can be found [here](http://herokuapp.com/trigger-backend-staging)

### Usage
After cloning this repo...
- Install dependancies with `$ bundle`
- Run the test suite using rspec with `$ bundle exec rspec`
- Run the server locally with `$ rails s`. The server runs on port 3000 by default, at `http://localhost:3000`
- API endpoints are nested under `/api/v1`.
 - Example: `GET localhost:3000/api/v1/foods`

### Endpoints
  - Endpoints are documented in OpenAPI 3.0 (formerly Swagger Specification) and can be found in the `openapi.yaml` file in this projects root directory
  - Details about OpenAPI 3.0 can be found [here](https://swagger.io/docs/specification/about/)
  - A visual, interactive version of the documentation can be rendered by copying the `openapi.yaml` file and pasting it's contents into the [Swagger Editor](https://editor.swagger.io/)

### SCHEMA DESIGN
![alt text](https://raw.githubusercontent.com/prestonjarnagin/trigger_backend/master/schema_design.png)

### Core Contributors

##### Front End Creators
* Cesar Jolibois - Github: [Diazblack](https://github.com/Diazblack)
* Michael Gatewood - Github: [mngatewood](https://www.github.com/mngatewood)

##### Back End Creators
* Quinn krug - Github: [Q-Win](https://github.com/Q-Win)
* Preston Jarnagin - Github: [prestonjarnagin](https://www.github.com/prestonjarnagin)


### To Contribute
Fork and clone this repository. If you generate a pull request,  we can start a discussion about of the feature you build or you can contact us in the links above.

### Future Improvements
- The schema can be simplified by generalizing the two pairs of tables into a single pair of joined tables that track activities and activity instances. This could be used to track not only foods and reactions, but things like exercise, and the use of certain products like cosmetics, as well

#### Built With
- Ruby & Rails
- RSpec
- FastJSON
- Pry
- SimpleCov
- ShouldaMatchers
