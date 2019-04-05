Trestle.resource(:questions) do
  menu do
    item :questions, icon: 'fa fa-question'
  end

  table do
    column :description
    actions
  end

  form do
    text_field :description
    render 'answers'
  end
end
