task setup_data: :environment do 
	Role.create(name: "admin")
	Role.create(name: "student")

	admin = User.create(name: "Aswin", email: "aswin@gmail.com", password: "aswin123")
	admin.roles.push(Role.first)


	student = User.create(name: "Athul", email: "athul@gmail.com", password: "athul123", is_confirmed: false)
	student.roles.push(Role.last)
end