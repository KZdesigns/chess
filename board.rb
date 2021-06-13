require_relative 'pieces'

class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        fill_board
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "There is no piece to move" if self[start_pos].nil?

        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece
    end

    def fill_board
        @rows.each_with_index do |row, row_idx|
            row.each_with_index do |col, col_idx|
                pos = [row_idx, col_idx]
                if row_idx <= 1 || row_idx >= 6
                    self[pos] = Piece.new
                else
                    self[pos] = nil
                end
            end
        end
    end

end