# TweedlyDo

TweedlyDo is a web application for tracking lists of things to do.

# Usage

* Clone the repository
* Run     'rake db:migrate' to set up the database
* Run     'rake db:seed' if you would like sample data

# TODO

* A todo requires a title and can have notes and a due date.
* Each list's show page should only show incomplete tasks; once you mark a task as complete, you cannot see it on the default list page.
* The list page should allow you to mark tasks as complete from that page in an intuitive way (that is, a list of tasks with checkboxes beside them and a button to update them -- or maybe something else).
* Bonus: Allow uploads on todo tasks.
* Bonus: Allow people to assign each other tasks. When they do, they go into a special list, "From <person>", where <person> is the person assigning it.
