
# Bugzilla
Complete project where managers will create the projects and the bugs in projects. and they can assign these bugs and projects to developers and QA's.
When project will assign to any user , email will be sent to user with sidekiq (background job) that this project or bug is assigned to you. 
Qa' can create the bugs in project and assign to developers.
developers can solve the bugs which are assign to them and update the status of bug when completed. 
Developer can also pick any bug from the project bugs and can assign to himself.
Search is also implemented for projects and bugs.
