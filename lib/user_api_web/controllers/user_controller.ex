defmodule UserApiWeb.UserController do
  use UserApiWeb, :controller

  def index(conn, _params) do #primer parametro la conexion
    conn
    |> put_status(401)
    |> text("Index")
    #todas las funciones del router recibira estos 2 parametros
  end

  def show(conn, %{"id" => user_id}) do #pattern matching a nivel de parametro, llegara un mapa con un id y se asigna al user ID
    IO.inspect(self()) #Proceess id de donde esta corriendo esto, devuelve en que proceso estoy
    #Todo codigo de elixir corre dentro de un proceso, SIN EXCEPCION
    #Por cada peticion me da una conexion diferente
    #IO.inspect(params)
    case UserApi.User.search(user_id) do
      nil ->
        conn
        |> put_status(404)
        |> text("Error!!!")
      _user ->
        conn
        |> put_status(200)
        |> text("Exito!!!")
    end
    #conn
    #|> put_status(401)
    #|> text("Show")
  end

  def create(conn, params) do
    changeset = UserApi.User.create_changeset(%UserApi.User{}, params)
    IO.inspect(changeset)
    case changeset.valid? do
      true ->
        user = UserApi.Repo.insert!(changeset) # ! si changeset falla, mandara una EXCEPCION
        conn
        |> put_status(200)
        |> text("Elemento insertado")
      false ->
        conn
        |> put_status(400)
        |> text("Error en los datos")
    end

    conn
    |> put_status(401)
    |> text("Create")
  end
end
