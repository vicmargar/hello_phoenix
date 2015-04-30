defmodule HelloPhoenix.CardController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Card

  plug :scrub_params, "card" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    cards = Repo.all(Card)
    render conn, "index.html", cards: cards
  end

  def new(conn, _params) do
    changeset = Card.changeset(%Card{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"card" => card_params}) do
    changeset = Card.changeset(%Card{}, card_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      # |> put_flash(:info, "Card created successfully.")
      |> redirect(to: card_path(conn, :index))
    else
      render conn, "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    card = Repo.get(Card, id)
    render conn, "show.html", card: card
  end

  def edit(conn, %{"id" => id}) do
    card = Repo.get(Card, id)
    changeset = Card.changeset(card)
    render conn, "edit.html", card: card, changeset: changeset
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    card = Repo.get(Card, id)
    changeset = Card.changeset(card, card_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      # |> put_flash(:info, "Card updated successfully.")
      |> redirect(to: card_path(conn, :index))
    else
      render conn, "edit.html", card: card, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    card = Repo.get(Card, id)
    Repo.delete(card)

    conn
    # |> put_flash(:info, "Card deleted successfully.")
    |> redirect(to: card_path(conn, :index))
  end
end
