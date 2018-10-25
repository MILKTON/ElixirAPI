defmodule UserApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do #Macro para definir el esquema
    field(:name, :string)
    field(:age, :integer)
    field(:company)
    field(:city)
    timestamps()
  end

  # Se llamara desde el controlador, se asociara a user con binding, se recibiran los parametros
  # A la estructura vacia se le pasa por la funcion cast que recibira: estructura vacia, datos y
  # atributos a los que quiero que asigne valor que datos quiero extraer de lo que me mandan
  # se asignan correctamente a la estrucutura
  # Validate: marca error si no viene nombre, edad o ambos.
  def create_changeset( user = %UserApi.User{}, params) do
    user
    |> cast(params, [:name, :age, :company])
    |> validate_required([:name, :age])
  end

  def search(user_id) do
    query =
      from(u in UserApi.User,
            where: u.id == ^user_id,
            select: u
      )
    UserApi.Repo.one(query)   #Aqui se hace la query, se pide solo uno
  end
end
