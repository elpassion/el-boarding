class ElBoardingSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
