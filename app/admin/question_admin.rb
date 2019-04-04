Trestle.resource(:questions, mode: Question) do
  menu do
    item :questions, icon: 'fa fa-question'
  end

  table do
    column :description
    actions
  end

  form do
    text_field :description
  end
end
