# README

#### SCHEMA DESIGN
NOTE: Needs to add time to food_entry and reaction_entry tables
![alt text](https://raw.githubusercontent.com/prestonjarnagin/trigger_backend/master/schema_design.png)

#### GET api/v1/foods

Returns all foods in the database.

ex:

GET api/v1/foods
```
{
    "data": [
        {
            "id": "1",
            "type": "food",
            "attributes": {
                "name": "Coffee"
            }
        },
        {
            "id": "2",
            "type": "food",
            "attributes": {
                "name": "Hot Dog"
            }
        }
    ]
}
```

#### POST api/v1/foods?name="string"

Adds new food to the database. Takes in body that contains the name.

ex:

POST api/v1/foods

body: {name: "Hot Dog"}

```
{
    "status": "Created Hot Dog"
}

```

#### GET api/v1/reactions

Returns all reactions in the database.

ex:

GET api/v1/reactions
```
{
    "data": [
        {
            "id": "1",
            "type": "reaction",
            "attributes": {
                "name": "Headache"
            }
        },
        {
            "id": "2",
            "type": "reaction",
            "attributes": {
                "name": "Upset Stomach"
            }
        }
    ]
}
```
#### POST api/v1/reactions

Adds new reaction to the database. Takes in body that contains the name.

ex:

POST api/v1/reactions

body: {name: "Headache"}

```
{
    "status": "Created Headache"
}

```


#### GET /api/v1/reaction_entries
Returns all reaction instances in the databse
ex:
```
GET api/v1/reaction_entries

RESPONSE:

#### GET api/v1/food_entries

Returns all food entries in the database.

ex:

GET api/v1/food_entries
```

{
    "data": [
        {
            "id": "1",

            "type": "reaction_entry",
            "attributes": {
                "reaction_id": 1,
                "time": 1550104352

            "type": "food_entries",
            "attributes": {
                "food_id": 1,
                "time": 1000000

            }
        },
        {
            "id": "2",

            "type": "reaction_entry",
            "attributes": {
                "reaction_id": 1,
                "time": 1550104580

            "type": "food_entries",
            "attributes": {
                "food_id": 2,
                "time": 1000000

            }
        },
        {
            "id": "3",

            "type": "reaction_entry",
            "attributes": {
                "reaction_id": 2,
                "time": 1550104589

            "type": "food_entries",
            "attributes": {
                "food_id": 2,
                "time": 2000000

            }
        }
    ]
}
```


#### POST /api/v1/reaction_entries
Creates a new instance of a given reaction. Takes a timestamp (in UNIX time format), and a reaction id

ex:
```
POST api/v1/reaction_entries
BODY:
{
	"reaction_id": "1",
	"time": "1550103834"
}

RESPONSE:
{
    "status": "Entered reaction at 1550103834"
}
```
#### PATCH /api/v1/reaction_entries/:id
Updates a given reaction instance timestamp

ex:
```
PATCH api/v1/reaction_entries/3

BODY:
{
	"reaction_id": "1",
	"time": "15501038"
}

RESPONSE:
{
    "status": "Record Updated"
}
```
#### DELETE /api/v1/reaction_entries/:id
Removes a given reaction instance

ex:
```
DELETE api/v1/reaction_entries/3

RESPONSE:
{
    "status": "Record Deleted"
}
=======
#### POST api/v1/food_entries

Adds new food entry to the database. Takes in body that contains the food_id and time.

The time is in UNIX

ex:

POST api/v1/food_entries

body: {food_id: 1, time: 1000000}

```
{
    "status": "Created Headache"
}


```

#### PATCH api/v1/food_entries/:id

Updates food entry to the database. Takes in body that contains the time.

The time is in UNIX

ex:

PATCH api/v1/food_entries/:id

body: {food_id: 1, time: 1000000}

```
{
    "status": "Created Headache"
}

```
