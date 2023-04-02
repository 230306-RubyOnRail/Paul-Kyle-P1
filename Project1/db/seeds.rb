# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
employee = Job.create([{ title: "employee", salary: 50000 }])
manager = Job.create([{ title: "manager", salary: 80000 }])

Personnel.create(username: "abaker", pass: "123", name: "Adams Baker", title: employee[0].id)
Personnel.create(username: "cdavis", pass: "123", name: "Clark Davis", title: employee[0].id)
Personnel.create(username: "efrank", pass: "123", name: "Evans Frank", title: employee[0].id)
Personnel.create(username: "ghills", pass: "123", name: "Ghosh Hills", title: employee[0].id)
Personnel.create(username: "ijones", pass: "123", name: "Irwin Jones", title: employee[0].id)

Personnel.create(username: "klopez", pass: "456", name: "Klein Lopez", title: manager[0].id)
Personnel.create(username: "mnalty", pass: "456", name: "Mason Nalty", title: manager[0].id)

ReimbursementRequest.create(personnel_id: 1, request_amount: 432.24, subject: "home office chair", request: "Hello, I would like my office chair to be reimbursed")
ReimbursementRequest.create(personnel_id: 1, request_amount: 900.78, subject: "new computer", request: "new computer for work")
ReimbursementRequest.create(personnel_id: 1, request_amount: 55.23, subject: "new offices pens", request: "")
ReimbursementRequest.create(personnel_id: 4, request_amount: 10.23, subject: "printer paper", request: "printer paper")
ReimbursementRequest.create(personnel_id: 4, request_amount: 91.53, subject: "printer ink", request: "printer ink")
