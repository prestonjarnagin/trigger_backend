# README

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

Adds new food to database. Takes in params of name.

ex:

POST api/v1/foods?name=Hot Dog

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
#### POST api/v1/reactions?name="string"

Adds new reaction to database. Takes in params of name.

ex:

POST api/v1/reactions?name=Headache

```
{
    "status": "Created Headache"
}

```
