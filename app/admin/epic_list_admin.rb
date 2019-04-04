Trestle.resource(:epic_list, model: EpicList) do
  menu do
    item :epic_list, icon: 'fa fa-list'
  end

  table do
    column :name
    column :created_at, align: :center
    actions
  end

  form do
    text_field :name
    select(:epic_ids, options_for_select(Epic.all.map { |epic| [epic.name, epic.id] }.unshift, form.object.epics.pluck(:id)),
           { label: 'Epic list' }, multiple: true)
  end
end
