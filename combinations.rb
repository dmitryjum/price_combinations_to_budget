require 'pry'

class Combinations
  attr_reader :budget, :prices, :least_summands
  def initialize(menu_path)
    parsed_menu = parse_menu(menu_path)
    @budget = parsed_menu[""]
    @prices = parsed_menu.values.drop(1).sort.reverse
    @least_summands = []
  end

  def get_all_sums(prices)
    current_sum = @least_summands.reduce(:+).to_f
    return @least_summands if prices.empty?
    if current_sum < budget
      @least_summands << prices.first
      get_all_sums(prices)
    elsif current_sum > budget
      @least_summands.pop
      get_all_sums(prices.drop(1))
    else
      @least_summands
    end
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
combs.get_all_sums(combs.prices)
puts combs.least_summands