Trestle.resource(:epic) do
  menu do
    item :epics, icon: 'fa fa-list-alt'
  end

  scopes do
    scope :deleted, -> { Epic.unscoped.where(hidden: true) }
    scope :undeleted, -> { Epic.default_scoped }
  end

  table do
    column :name
    column :created_at, align: :center
    actions do |toolbar, instance, admin|
      toolbar.link 'Delete', admin.path(:update_hidden, id: instance.id), class: 'btn btn-danger', icon: 'fa fa-trash-o'
    end
  end

  form do |epic|
    tab :epic do
      text_field :name
    end

    tab :tasks, badge: epic.tasks.size do
      table epic.tasks, admin: :tasks do
        column :name, link: true
        column :description
        column :created_at, align: :center
        actions
      end

      concat admin_link_to('New Task', admin: :tasks, action: :new, params: { epic_id: epic }, class: 'btn btn-success')
    end
  end

  controller do
    def destroy
      epic = Epic.unscoped.find(params[:id])
      epic.hidden ? epic.update(hidden: false) : epic.update(hidden: true)
      redirect_to epic_admin_index_path
    end

    def update_hidden
      epic = Epic.unscoped.find(params[:id])
      epic.hidden ? epic.update(hidden: false) : epic.update(hidden: true)
      redirect_to epic_admin_index_path
    end
  end

  routes do
    get :update_hidden, on: :member
    post :update_hidden, on: :member
  end
end
