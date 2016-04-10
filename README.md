#Read Me

###OBJECTIVES

1. Map a Ruby class to a database table and an instance of a class to a table row.
2. Write code that maps a Ruby class to a database table.
3. Write code that inserts data regarding an instance of a class into a database table row.

###MAPPING A CLASS TO A TABLE

When building an ORM to connect our Ruby program to a database, we equate a class with a database table and the instances that the class produces to rows in that table.

Why map classes to tables? Our end goal is to persist information regarding songs to a database. In order to persist that data efficiently and in an organized manner, we need to first map or equate our Ruby class to a database table.

Let's say we are building a music player app that allows users to store their music and browse their songs by song.
This program will have a Song class. Each song instance will have a name and an album attribute.
