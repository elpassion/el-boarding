Trestle.resource(:epic) do
  menu do
    item :epics, icon: 'fa fa-list-alt'
  end

  scopes do
    scope :undeleted, -> { Epic.where(hidden: false) }
  end

  table do
    column :name
    column :created_at, align: :center
    actions
  end

  form do |epic|
    tab :epic do
      text_field :name
    end

    tab :tasks, badge: epic.tasks.size do
      table epic.tasks, admin: :tasks do
        column :description, link: true
        column :created_at, align: :center
        actions
      end

      concat admin_link_to("New Task", admin: :tasks, action: :new, params: { epic_id: epic }, class: "btn btn-success")
    end
  end

  controller do
    def destroy
      epic = Epic.find(params[:id])
      epic.update(hidden: true)
      redirect_to epic_admin_index_path
    end
  end

end
