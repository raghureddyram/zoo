# API: Create a GraphQL API endpoint for `createNote` to create a new note tied to an `Employee`, and the same note can also be tied to an `Animal` and/or `Habitat`.
# 
module Mutations
    class CreateNote < BaseMutation
      # arguments passed to the `resolve` method
      argument :creator_id, String, required: true
      argument :notable_class, String, required: true
      argument :notable_id, String, required: true
      argument :secondary_notable_class, String, required: false
      argument :secondary_notable_id, String, required: false
      argument :label, String, required: false
      argument :data, String, required: false

      field :success, Boolean, null: false
      field :errors, [String], null: false
      field :note, Types::NoteType, null: true
  
  
      def resolve(creator_id: nil, notable_class: nil, notable_id: nil, data: nil, secondary_notable_class: nil, secondary_notable_id: nil, label: nil)
        employee = Employee.find_by(id: creator_id)
        notable = notable_class&.constantize&.find_by(id: notable_id)
        if employee.blank? | notable.blank?
            {note: nil, success: false, errors: ["Could not find notable or creator. Please ensure notable_id, notable_class, and creator_id passed in appropriately"]}
        end

        note = nil
        errors = []
        if data.present?
            data = data.gsub("'", '"') #replace with double quotes to form valid json
            begin
                data = JSON.parse(data)
            rescue => e
                errors << "Data unable to parse"
            end
        end
    
        if secondary_notable_class
            secondary_notable = secondary_notable_class&.constantize&.find_by(id: secondary_notable_id)
            errors << "Could not find secondary_notable based on secondary_notable_class or secondary_notable_id" if secondary_notable.blank?
        end
        
        note = Note.create({creator: employee, notable: notable, secondary_notable: secondary_notable,  data: data, label: label})

        
        if note&.id.present?
            {note: {id: note.id, data: data}, success: true, errors: errors}
        else
            {note: nil, success: false, errors: note.errors.full_messages}
        end
      end
    end
  end

