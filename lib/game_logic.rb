class Board
  attr_accessor :rows
  attr_reader :available_cells
  def initialize
    @rows = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    @available_cells = 9
  end
  puts @rows

  def display
    @rows.length.times do |i|
      @rows[i].length.times do |j|
        if j == 2
          puts @rows[i][j]
        else
          print @rows[i][j] + ' '
        end
      end
    end
    puts ''
  end

  def update(choice, token)
    choice = choice.to_i
    @available_cells -= 1
    if choice <= 3
      @rows[0][choice - 1] = token
    elsif choice <= 6
      @rows[1][choice - 4] = token
    else
      @rows[2][choice - 7] = token
    end
  end

  def valid_cell?(choice)
    choice = choice.to_i
    if choice <= 3
      @rows[0][choice - 1] == '_'
    elsif choice <= 6
      @rows[1][choice - 4] == '_'
    elsif choice <= 9
      @rows[2][choice - 7] == '_'
    else
      false
    end
  end

  def rows_match?
    result = []
    @rows.each do |row|
      result.push(row.all?('X') || row.all?('O'))
    end
    result.any?(true) ? true : false
  end

  def columns_match?
    result = []
    win_case = []
    cond1 = []
    cond2 = []
    cond3 = []
    win_case.push(cond1, cond2, cond3)
    3.times do |i|
      cond1.push(@rows[i][0])
      cond2.push(@rows[i][1])
      cond3.push(@rows[i][2])
    end
    win_case.each do |el|
      if el.all?('O')
        result.push(el.all?('O'))
      elsif el.all?('X')
        result.push(el.all?('X'))
      end
    end
    result.any?(true)
  end

  def diagonals_match?
    condition1 = []
    condition2 = []
    @rows.length.times do |i|
      condition1.push(@rows[i][i])
      condition2.push(@rows[i][2 - i])
    end
    if condition1.all?('O') || condition2.all?('O')
      true
    elsif condition1.all?('X') || condition2.all?('X')
      true
    else
      false
    end
  end

  def draw?
    if @available_cells.zero?
      (rows_match? == false) && (columns_match? == false) && (diagonals_match? == false)  ? true : false
    else
      false
    end
  end

  def win?
      return (rows_match? == true) || (columns_match? == true) || (diagonals_match? == true)
  end
end

class Player
  attr_accessor :player_movement, :name

  def initialize(name = '', current_winner = false, player_movement = '')
    @name = name
    @current_winner = current_winner
    @player_movement = player_movement
  end

  def sanitize_choice(choice)
    return false unless choice.length == 1

    choice = choice.to_i
    (choice != 0) && (choice >= 1) && (choice <= 9) ? true : false
  end
end
