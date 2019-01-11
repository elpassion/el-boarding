defmodule ElBoarding.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :description, :text
      add :done, :boolean, default: false, null: false
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:topic_id])
  end
end
