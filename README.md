# Rails simple blog app

## Api only


```
  Ruby 3.0.+
  Rails 7
```

#### Clone the repo into your local machine

* Install Gems

```
  $ bundle install
```

* Migrate the database

```
  $ rake db:migrate
```

* Seed the database

```
  $ rake db:seed
```

* Run the server

```
  rails s
```

* Open a new terminal tab and test the apis

## APIS
```
|         API               |   METHOD  |     DESCRIPTION
============================|===========|==================
|      /register            | POST      | create new account   
|      /login               | POST      | get authorization token
|      /users               | DELETE    | delete account

|      /posts               | GET       | get all posts
|      /posts               | POST      | create new post
|      /posts/:id           | PATCH/PUT | update post content
|      /posts/:id           | DELETE    | delete post

| /posts/:post_id/comments  | GET       | get all comments of the post
| /posts/:post_id/comments  | POST      | submit comment for post
|      /comments/:id        | PATCH/PUT | update comment
|      /comments/:id        | DELETE    | delete comment
-------------------------------------------------------------------------
```

### APis and Params
```
|         API               |          PARAMS
============================|=============================
|      /register            | user: { first_name, last_name, email, password, password_confirmation }  
|      /login               | user: { email, password }
|      /users               | confirmation_password

|      /posts               | post: { title, content }, title is optional
|      /posts/:id           | post: { content }

| /posts/:post_id/comments  | commment: { content }
```

Check out [test.sh](api_test.sh) or [test.rb](test.rb) file.

**NB:** You need to pass authorization token through header to do **post**, **patch** and **delete** operations. Get(read) operation does not need authorization token.

***Test***
```
  $ rails test
```
