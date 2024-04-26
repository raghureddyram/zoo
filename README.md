
--------------
'bundle install'

'bundle exec rails s'

'bundle exec sidekiq -C config/sidekiq.yml' (new terminal)

tests:
bundle exec rspec spec


---------


Overview

Develop a Ruby on Rails application to manage animals, their care, and habitats in a zoo. The system should track different types of animals, their diets, and habitats, and manage employee records securely.


Requirements

Enum: Use enums to define the status of animals (e.g., `healthy`, `sick`, `injured`) and employee roles (e.g., `vet`, `caretaker`, `manager`). This will facilitate easy status updates and role assignments within the system.

Array Type: Utilize array types to store multiple values where applicable, such as a list of daily feeding times for animals or a list of tasks for employees.

JSON Blob: Use JSON blobs to store flexible data, such as dietary requirements for each animal (which include food type, quantity, etc) and habitat preferences (temperature range, necessary features like water bodies for aquatic animals, trees for climbing animals, sand for desert animals).

Encrypt PII: Ensure the encryption of Personally Identifiable Information (PII) for employees, such as first name, last name, email, and phone number. 

Accepts Nested Attributes in GraphQL Mutation: Design the GraphQL API to allow for nested attributes in mutations. 

This app will run on a local, air-gapped intranet, so authentication is not necessary.

This will start as a small app to handle only 40-75 animals, but if the zoo likes it, it would like to know how to scale it to hundreds of zoos, thousands of animals, and the API would need to handle hundreds of thousands of concurrent users. Please diagram the app infrastructure for scale.

Coding Project Tasks

Model Setup: Create models for `Animal`, `Habitat`, `Employee`, and `Note` with the specified associations and fields. Include validations to ensure data integrity.

Enums and Array Types: Define enums for animal status and employee roles. Use array types for storing feeding times and tasks.

JSON Storage: Implement JSON blobs for dietary requirements and habitat preferences in the relevant models.

Data Encryption: Securely encrypt employee PII fields in the database.

GraphQL Setup: Setup GraphQL with Ruby on Rails, defining types and mutations that support nested attributes, showcasing how to create or update complex data structures in a single request.

API: Create a GraphQL API endpoint for `createAnimal` to create a new animal, and create a new habitat, or assign it to an existing habitat. 

API: Create a GraphQL API endpoint for `createNote` to create a new note tied to an `Employee`, and the same note can also be tied to an `Animal` and/or `Habitat`.

API: Create a GraphQL endpoint `getAnimals` which can return all animals, and can be filtered for `in_habitat` and/or `needing_attention` which will return the applicable animals. The animal data should include dietary requirements and habitat preferences, as well as notes on the animal and its habitat and which employee created the notes.

Seed Data: Provide seed data that illustrates the system's functionality, including various animals, habitats, employee roles, and notes/comments.

 **Test Suite**: Write a comprehensive test suite covering models, requests, and GraphQL mutations to ensure the system works as expected and handles edge cases.


# --
# Ace Goulet
# VP, Engineering Operations

# Savvy Labs Inc


# Tasks
    id
    name
    description
    animal_id: foreign_key
    time
    type: enum [feed, bathe, socialize]
    status: enum ["complete", "needing_attention"]
    scheduling_interval - hrs 

# Animal
    #dietary_requirement - lead to the note
    #status: enum: [`healthy`, `sick`, `injured`]
    current_location

    has_many employees through animal_employee
    has_many feeding_times, Model: Task, type: "feed"
    has_many tasks
    has_many notes as dietary_requirements, type: "dietary_requirements"
    belongs_to habitat
    has_many notes



#AnimalEmployee
    id
    animal_id
    employee_id

    belongs_to animal
    belongs_to employee

# Employee
    #id
    #encrypted_phone
    #encrypted_first_name
    #encrypted_last_name
    #encrypted_email
    #roles: enum: [`vet`, `caretaker`, `manager`]

    has_many animals through animal_employee
    belongs_to zoo
    has_many notes


# Habitat
    # preference (temperature range, necessary features like water bodies for aquatic animals, trees for climbing animals, sand for desert animals)
    # json: habitate_preference 

    id
    name
    has_many: animals
    has_many notes as habitate_preference
    belongs_to zoo
    

# Zoo - currently single instance
    has_many habitats
    has_many employees

# Note [polymorphic table] - can belong to habitat or animal or employee
    # id
    # data: json
    # type: [dietary_requirements, habitate_preference, employee_note]
    # created_by_id  -> references employee id

    .created_by -> should pull up the employee by id
    
