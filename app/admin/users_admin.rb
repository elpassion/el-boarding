Trestle.resource(:users, mode: User) do
  menu do
    item :users, icon: "fa fa-star"
  end

  table do
    column :name
    column :created_at, align: :center
    actions
  end

  form do
    text_field :name
  end
end
