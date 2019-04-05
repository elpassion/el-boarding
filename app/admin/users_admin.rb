Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-star"
  end

  table do
    column :email
    column :created_at, align: :center
    actions
  end

  form do
    text_field :email
  end
end
