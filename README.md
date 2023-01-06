The challenge is to build a REST application from scratch that could serve as a work planning service.
--------------------------------------------------------------------------

Business requirements:

    A worker has shifts
    A shift is 8 hours long
    A worker never has two shifts on the same day 
    It is a 24 hour timetable 0-8, 8-16, 16-24 
    
Preferably write a couple of units tests.

My DESIGN PROCESS
------------------
Based on the given business requirements, the design a database schema for a REST application in Rails 7 as follows:
		Create a User model to represent a user. attributes - name, email, password
    Create a Worker model to represent a worker. attributes - title, dept.

    Create a Shift model to represent a shift. attributes such as start_at and end_at to represent the start and end times of the shift, and a worker_id foreign key to reference the worker who is working the shift.

    Set up relationships between the models:
        A worker has_many shifts
        A shift belongs_to a worker 
        A User has_one worker
        A Worker belongs_to user

With this schema, you can store and retrieve information about workers, shifts, and the user, and enforce the business rules such as a worker never having two shifts on the same day and a shift being 8 hours long via validation rules.

This is just one possible way to design the database schema based on the given business requirements. There may be other approaches that would work equally well or better, depending on the specific needs of the application.

user model: name email password
worker model: title, dept  (string)
shift model: start_at  end_at datatype(integer)


Tech stack : rails 7, Ruby, SQlite, Devise

The app however is not exhaustive as there are many more features that can be added to make it a fully fledged complete for public use.
