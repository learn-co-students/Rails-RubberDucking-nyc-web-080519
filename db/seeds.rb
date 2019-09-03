puts "deleting..."

Duck.delete_all
Student.delete_all

puts "seeding..."

10.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

puts "made students. creating ducks..."

5.times do
  duck = Duck.create(name: Faker::Name.name, description: Faker::Name.name, student_id: rand(1..10))
  # duck.update(student_id: sample(1..10))
end

puts "done"