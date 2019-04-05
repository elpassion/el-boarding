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
    select :epic_id, Epic.all, label: 'Epic'
    render 'answers'
  end
end
