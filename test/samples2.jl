#https://github.com/JamesRonsonOp/SQL_Training_with_Pagila/blob/main/pagila_question_sets/pagila_question_set_1.md
#1a. You need a list of all the actors’ first name and last name
@testsql map(Pagila.query_actor(), :first_name, :last_name),
 "SELECT a.first_name, a.last_name FROM actor a"
 #1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name
 @testsql map(Pagila.query_actor()) do a
    a.first_name * " " * a.last_name
 end,
 "SELECT CONCAT(a.first_name, ' ', a.last_name) AS elem1 FROM actor a"

 #2a. You need to find the id, first name, and last name of an actor of whom you know only the first name of "Joe." What is one query would you use to obtain this information?
 @testsql (@chain Pagila.query_actor() begin
    filter(a -> a.first_name == "JOE", _)
    map(_, :actor_id, :first_name, :last_name)
 end), "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.first_name = 'JOE'"

 #2b. Find all actors whose last name contain the letters GEN. Make this case insensitive
 @testsql (@chain Pagila.query_actor() begin
    filter(a -> a.first_name == like"JOE", _)
 end), "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.first_name = 'JOE'"

 #2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
