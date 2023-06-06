defmodule <%= inspect assigns.repo %>.Migrations.CreateRutliTables do 
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm", ""
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:rutli_npas, primary_key: false) do 
      add :id, :integer, primary_key: true
      add :code, :integer, null: false
      add :code_ext, :integer, null: false
      add :name, :string, null: false
    end

    create table(:rutli_streets, primary_key: false) do 


    end

    create table(:rutli_addresses, primary_key: false) do 


    end
  end
end
