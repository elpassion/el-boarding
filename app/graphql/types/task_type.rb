class Types::TaskType < Types::BaseObject
  field :id, Integer, null: false
  field :name, String, null: false
  field :description, String, null: false
end