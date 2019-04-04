Trestle.resource(:epic) do
  menu do
    item :epics, icon: 'fa fa-list-alt'
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
