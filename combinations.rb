require 'pry'

class Combinations
  attr_reader :budget, :prices
  def initialize(menu_path)
    parsed_menu = parse_menu(menu_path)
    @budget = parsed_menu[""]
    @prices = parsed_menu.values.drop(1)
  end

  def get_all_sums
    binding.pry
  end

  private

  def parse_menu(file)
    budget = {}
    File.open(file).each_line do |line|
      budget[line.chomp.split("$")[0]] = line.chomp.split("$")[1].to_f
    end
    budget
  end
end

combs = Combinations.new('./menu.txt')
binding.pry