class Types::QuestionType < Types::BaseObject
  field :id, Integer, null: false
  field :description, String, null: false
  field :answers, [Types::AnswerType], null: true, description: 'Answers'
end