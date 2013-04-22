# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ctlm = Lot.create({ 
    name: 'CTLM Upper',
    total_spots: 300,
    cars: 300
})

rec = Lot.new(
    {
    name: 'REC Center',
    total_spots: 50,
    cars: 20,
    type_type: "blue"
})

if !(rec.valid?)
    puts rec.errors.full_messages.join(";")
else
    rec.save

    rec.coordinates.create([ 
        {
            order: 0,
            x: 549,
            y: 227
        },
        {
            order: 1,
            x: 653,
            y: 227
        },
        {
            order: 2,
            x: 656, 
            y: 321,
        },
        {
            order: 3,
            x: 550,
            y: 323
        }])
end
