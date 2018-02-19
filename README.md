# Todolist toy-application

The purpose of this application is to get acquainted with simple_form, devise, pundit, activeadmin and grape gems.

Application uses **ruby v2.5.0**

## Installation
After cloning repository run:
```
rails db:setup
rails s
```
## Devise
Fields required for user to sign in are:
* email
* nickname
* password

## Active admin
Credentials for admin are default ones: 'admin@example.com/password'
Admin does not require nickname to be provided.

## API
API does not reflect application's behaviour 1:1, as currently API authentication is not implemented. In some cases access is limited (e.g. index will only show public todolists), sometimes it's empowered (everyone can delete any todolist).

API versioning strategy is param. To call other version then default (latest), please use command below:
```
curl http://localhost:3000/api/todolists?version=v1
```
### Exemplary calls using curl
```
# Get all todolists
curl http://localhost:3000/api/todolists

# Get todolist and associated tasks
curl http://localhost:3000/api/todolists/1

# Create todolist
curl -d '{ "name": "API Todolist", "private": "True", "user_id": "1" }' 'http://localhost:3000/api/todolists/' -H Content-Type:application/json -v

# Create task
curl -d '{ "title": "API Task", "description": "New task created using API!" }' 'http://localhost:3000/api/todolists/1/tasks' -H Content-Type:application/json -v

# Delete todolist
curl -X DELETE 'http://localhost:3000/api/todolists/1'
```
