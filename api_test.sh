#!/bin/bash

## Registration

curl -H "Content-type: application/json" \
     -X POST \
     -d ' {"user":{"first_name":"Joh","email":"john@gmail.com","password":"123456789"}} ' \
       http://localhost:3000/register

## Login
#
# curl -H "Content-type: application/json" \
#      -X POST \
#      -d ' {"user":{"email":"john@gmail.com","password":"123456789"}} ' \
#       http://localhost:3000/login && echo

## DELETE Account
# curl  -X DELETE \
#       -H "Content-type: application/json" \
#       -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQzMTUyMjM0fQ.T5zTtusIFBs6eSNBHLBFy6e_NDTHWCdAZEchLHY-oQM" \
#       -d '{"confirmation":{"password":"123456789"}} ' \
#       http://localhost:3000/users

## Posts

### New post
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQzMTU0MzE3fQ.yg_qrTxYNF_yniew2XjPYLsfR41NJMgQ0Q_mXIw0kik" \
#      -X POST \
#      -d ' {"post":{"title":"hello world","content":"THis is hello world post"}} ' \
#        http://localhost:3000/posts && echo

### Get posts
# curl -H "Content-type: application/json" \
#      -X GET \
#      -d ' {"p":"1"} ' \
#       http://localhost:3000/posts && echo

### GET single post
# curl -H "Content-type: application/json" \
      # http://localhost:3000/posts/1 && echo

## Delete post
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQzMTU0MzE3fQ.yg_qrTxYNF_yniew2XjPYLsfR41NJMgQ0Q_mXIw0kik" \
#      -X DELETE \
#        http://localhost:3000/posts/1 && echo

# Comments
# new comment
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQxMTQxMjE1fQ.zIB2TdBP3q60XEPh0wFyxCqIGQyFz6ETuNBadd6vBcI" \
#      -X POST \
#      -d ' {"comment":{"content":"THis is test comment"}} ' \
#        http://localhost:3000/posts/7/comments && echo

# comments
# curl -H "Content-type: application/json" \
#        http://localhost:3000/posts/7/comments

# single comment
# curl -H "Content-type: application/json" \
#        http://localhost:3000/comments/2

# delete
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQxMTQxMjE1fQ.zIB2TdBP3q60XEPh0wFyxCqIGQyFz6ETuNBadd6vBcI" \
#      -X DELETE http://localhost:3000/comments/2 && echo
