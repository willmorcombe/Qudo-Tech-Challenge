# Project Overview

Project in django (4.1), database MySQL. Endpoints where created for all basic functionality. 

## Running

Clone repo, using a virtual enviroment download all requirements from requriements.txt, Install database on MySQL host (I used localhost). You can access database dump from 'database/seeds/'. 

## Endpoints
Accounts
- register -> /account/register
- login -> /account/login
- logout -> /account/logout

Store
- view products -> /store
- view individual products -> /store/<product_id>
- order products -> /store/order/
- view order history -> /store/order/history

## Expansions
- For token authentication, using a refresh token to retrieve another access token for security and useability (using something like jwt to do this).
- Adding a UI to access the endpoints, potentially in React.
- Implementing a payment model into the existing project structure.


