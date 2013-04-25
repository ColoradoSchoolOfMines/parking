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
            x: 497,
            y: 188
        },
        {
            order: 1,
            x: 602,
            y: 188
        },
        {
            order: 2,
            x: 600, 
            y: 285,
        },
        {
            order: 3,
            x: 496,
            y: 286
        }])
end
