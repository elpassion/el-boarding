class Types::EpicListType < Types::BaseObject
  description 'Epic list'

  field :id, Integer, null: true
  field :name, String, null: true

  field :epics, [Types::EpicType], null: true, description: 'Epics'
end
