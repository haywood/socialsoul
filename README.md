socialsoul
==========

twitter API docs
https://dev.twitter.com/docs/api/1.1

ntwitter nodejs module
https://github.com/AvianFlu/ntwitter

mongodb database
https://github.com/mongodb/node-mongodb-native
http://www.mongodb.org/



### setup

1. install mongodb http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/
2. install phantomjs `brew update && brew install phantomjs`
3. setup app
```
cd app
npm install
```


### to run
1. start mongo ```mongod```
2. start app ```node app.js```



### endpoints

* ```/screen/:id``` -- view for screen (int or "exit")
* ```/``` -- view all 48 screens in iframes

* ```/controller``` -- BA controller page

* ```/controller?action=trigger``` -- start with current user
* ```/controller?action=set_user&user=XXX``` -- set next user
* ```/controller?action=build_db``` -- rebuild the cached mentor db / data

* ```/storage``` -- view all in mongodb

