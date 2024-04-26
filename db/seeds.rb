# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

zoo1 = ZoologicalPark.create!(name: "Amazing Animal Acres")
zoo2 = ZoologicalPark.create!(name: "Wilderness Wonders")

habitat1 = zoo1.habitats.create!(name: "African Savanna")
habitat2 = zoo1.habitats.create!(name: "Tropical Rainforest")
habitat3 = zoo2.habitats.create!(name: "Arctic Tundra")

employee1 = Employee.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@zoo.com",
  phone: "(555) 555-1212",
  zoological_park: zoo1
)

employee2 = Employee.create!(
  first_name: "Jane",
  last_name: "Smith",
  email: "jane.smith@zoo.com",
  phone: "(555) 555-3434",
  zoological_park: zoo2
)

animal1 = Animal.create!(
  species: "Lion",
  status: 1,
  primary_habitat: habitat1  # You can set a custom status based on your definition (e.g., Active)
)

animal2 = Animal.create!(
  species: "Monkey",
  primary_habitat: habitat1,  # Assign primary habitat
  current_habitat: habitat2   # Assign current habitat (same for now)
)

animal3 = Animal.create!(
  species: "Polar Bear",
  status: 0 ,
  primary_habitat: habitat1 
)


task1 = Task.create!(
  name: "Morning Feeding",
  description: "Provide lion with a balanced meal",
  scheduling_interval: "1d",  
  task_type: 0,  
  due: Time.now + 1.hour ,
  animal: animal1
)

task2 = Task.create!(
  name: "Enclosure Cleaning",
  description: "Clean monkey enclosure",
  scheduling_interval: "1w",  
  task_type: 1,  
  animal: animal2
)

note1 = Note.create!(
  notable_type: "Animal",
  notable_id: animal1.id,
  data: { observation: "Lion seems lethargic this morning" },
  label: 1,  
  creator: employee1
)
