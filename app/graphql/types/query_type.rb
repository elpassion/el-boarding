module Types
  class QueryType < Types::BaseObject
    field :epic_list, EpicListType, null: false do
      description "Epic lists"
      argument :id, ID, required: true
    end

    def epic_list(id:)
      EpicList.find(id)
    end
  end
end
