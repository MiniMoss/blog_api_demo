# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

############################
# For devise
############################
# create roles
Role.create!([{name: 'admin'}, {name: 'moderate'}])

# create User 'admin'
User.create!(user_name: 'admin', password: 'aaaaaaaa', email: 'admin@admin.com', role_ids: '1')
############################
# End For devise
############################
