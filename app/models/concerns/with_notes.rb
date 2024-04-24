module WithNotes
    def self.included(base)
      base.includes(:notes)
    end
end