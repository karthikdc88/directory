desc "This task file is for setting up roles and users for the app"
task :setup_admin => :environment do 
Role.delete_all
Role.create(name: "admin")
Role.create(name: "client")

User.create(email: "admin@gmail.com", password: "secret123")

Permission.create(user_id: User.find_by_email("admin@gmail.com").id, role_id: Role.find_by_name("admin").id)

        for user in User.all
            if (user.roles.empty?)
                Permission.create(user_id: user.id, role_id: Role.find_by_name("client").id)
            end
        end
end