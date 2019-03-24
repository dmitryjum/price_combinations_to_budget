require 'pry'

class Combinations
  def initialize
    parsed_menu = parse_menu('./menu.txt')
    budget = parse_menu[""]
    prices = parsed_menu.values.drop(1)
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

combs = Combinations.new