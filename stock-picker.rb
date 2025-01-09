# # > stock_picker([17,3,6,9,15,8,6,1,10])
# # => [1,4]  # for a profit of $15 - $3 == $12
# def stock_picker(prices)
#   max_profit = 0
#   best_days = []

#   prices.each_with_index do |buy_price, buy_day|
#     prices[buy_day + 1..-1].each_with_index do |sell_price, sell_offset|
#       sell_day = buy_day + 1 + sell_offset
#       profit = sell_price - buy_price

#       if profit > max_profit
#         max_profit = profit
#         best_days = [buy_day, sell_day]
#       end
#     end
#   end

#   best_days
# end

# # Example usage
# p stock_picker([17,3,6,9,15,8,6,1,10])  # => [1, 4] (Buy at $3 on day 1, sell at $15 on day 4)

def stock_picker(array)
  # initialize some variables
  largest_delta = 0
  buy_index = 0
  sell_index = 0

  # begin loop for each with index to capture array value and index
  array.each_with_index do |price, i|
    (i..array.length-1).each do |j| # iterate over the current index and all future indices
      delta = array[j] - price
      if delta > largest_delta # find largest delta between indices and assign buy and sell indices
        largest_delta = delta
        sell_index = j
        buy_index = i
      end
    end
  end
  p [buy_index, sell_index]
end

stock_picker([17,3,6,9,15,8,6,1,10])