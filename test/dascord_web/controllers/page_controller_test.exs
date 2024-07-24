defmodule DascordWeb.PageControllerTest do
  use DascordWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert 1 = 1
  end
end
