Trestle.resource(:tasks) do
  table do
    column :name
    column :description
    column :created_at, align: :center
    actions
  end

  form do
    text_field :name
    text_area :description
    hidden_field :epic_id
  end

  build_instance do |attrs, params|
    scope = params[:epic_id] ? Epic.find(params[:epic_id]).tasks : Task
    scope.new(attrs)
  end

  return_to on: [:create, :update] do |instance|
    edit_epic_path(instance.epic)
  end
end
