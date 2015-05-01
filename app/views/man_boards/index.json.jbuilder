json.array!(@man_boards) do |man_board|
  json.extract! man_board, :id, :sadaghe, :komak_valedein, :namaze_aval_vaght, :doroogh, :gheibat, :tohmat, :control_khashm
  json.url man_board_url(man_board, format: :json)
end
