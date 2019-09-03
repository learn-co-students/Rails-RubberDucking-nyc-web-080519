10.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

Duck.create(name: "duck1", description: "none", student_id: rand(1..10))
Duck.create(name: "duck2", description: "none", student_id: rand(1..10))
Duck.create(name: "duck3", description: "none", student_id: rand(1..10))
Duck.create(name: "duck4", description: "none", student_id: rand(1..10))
Duck.create(name: "duck5", description: "none", student_id: rand(1..10))
Duck.create(name: "duck6", description: "none", student_id: rand(1..10))
Duck.create(name: "duck7", description: "none", student_id: rand(1..10))
Duck.create(name: "duck8", description: "none", student_id: rand(1..10))
