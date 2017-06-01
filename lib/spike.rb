
def find_all_by_price_in_range(range)
  range.to_a.map do |num|
    @contents.map do |x|
      array = []
      range.test_item_class_exists
      @contents.map do |item|
        array << item if price.to_f == item.unit_price.to_f
      end
      array
    end

      new_range = (1..5)

      def find_all_by_price_in_range(range)
        array = []
        range.to_a.map do |num|
          array << find_all_by_price(num)
        end
        array.reject { |units| units.empty? }
      end
