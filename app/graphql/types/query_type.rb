module Types
  class QueryType < Types::BaseObject
    field :epic_list, EpicListType, null: false do
      description 'Epic lists'
      argument :id, ID, required: true
    end

    field :epic, EpicType, null: false do
      description 'Epics'
      argument :id, ID, required: true
    end

    def epic_list(id:)
      EpicList.find(id)
    end

    def epic(id:)
      Epic.find(id)
    end
  end
end
