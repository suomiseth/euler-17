class WritingNumbers

  def initialize(limit)
    @limit = limit
    @words = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "onethousand",
      :and => "and"
    }
  end

  def write_words
    (1..@limit).to_a.map do |n|
      digits = n.to_s.split('').map {|x| x.to_i}
      if digits.length == 1
        @words[(digits[0])]
      elsif digits.length == 2
        if digits[0] == 1 
          @words[(digits.join.to_i)]
        else
          @words[(digits[0] * 10)] + @words[(digits[1])]
        end
      elsif digits.length == 3
        word = @words[(digits[0])] + @words[100]
        word = word + @words[:and] if (digits[1] != 0 || digits[2] != 0)
        if digits[1] == 1 
          word = word + @words[(digits[1, 2].join.to_i)]
        else
          word = word + @words[(digits[1] * 10)] + @words[(digits[2])]
        end
        word
      else
        @words[1000]
      end
    end
  end

  def count_letters
    write_words.join.split('').length
  end
end


puts "give a limit"
limit = gets.strip.to_i
puts WritingNumbers.new(limit).count_letters