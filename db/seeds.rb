# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Anas", user_type: "manager", email: "anas.ahmad@engin.tech", password:"password")

User.create(name: "fatir", user_type: "developer", email: "fatir@test.com", password:"password")

User.create(name: "Ahmad", user_type: "qa", email: "bitf17a555@pucit.edu.pk", password:"password")

users = User.last(2).pluck(:id)
Project.create(name: "example project", user_ids: users)

Bug.create(title: "image bug", description: "A problem in image and it loads slowly due to big size", bug_type: "bug", status: "new", project_id: Project.last.id, user_id: User.last.id)
Bug.create(title: "title bug", description: "A problem in title  and it does not contain capitalize functionality due", bug_type: "bug", status: "new", project_id: Project.last.id, user_id: User.last.id)
Bug.create(title: "message feature", description: "A message featue should be added in application so users can talk each other", bug_type: "feature", status: "new", project_id: Project.last.id, user_id: User.last.id)

