class Command

  attr_accessor :instruction, :row, :column, :color, :from, :to

  @@instructions = {
    new_image: 'I',
    color_pixel: 'L',
    clear_image: 'C',
    show_image: 'S',
    vertical_line: 'V',
    quit: 'X'
  }

  def self.parse(user_command)
    command = user_command.split(' ')
    instruction = @@instructions.key(command[0])
    if(instruction.to_s.include?('line'))
      from = command[2].to_i
      to = command[3].to_i
      color = command[4] || 'O'
      column = command[1].to_i if instruction == :vertical_line
      self.new(instruction, nil, column, color, from, to)
    else
      row = command[1].to_i
      column = command[2].to_i
      color = command[3] || 'O'
      self.new(instruction, row, column, color, nil, nil)
    end
  end

  private

    def initialize(instruction, row, column, color, from, to)
      @instruction, @row, @column, @color, @from, @to = instruction, row, column, color, from, to
    end

end
