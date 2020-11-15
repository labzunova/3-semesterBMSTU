class OutputController < ApplicationController
  def output
    sequence = params[:sequence]
    @error = 1
    if sequence == ''
      @output = "you didn't write anything:("
    elsif sequence.to_i == 0
      @output = "please, enter a number"
    else
      @output = "Your initial sequence:" + sequence
      @error = 0
      res = Find(sequence)
      if res[0].length == 0
        @subsequences = "There are no rising subsequences"
        @error = 1
      else
        @subsequences = res[0]
        @max = "maximum length rising subsequence: " + res[1]
      end
    end
  end

  def Find(sequence)
    rising_subsequences = Array.new()
    #sequence = sequence.split(//).map(&:to_i)
    subsequence = sequence[0]
    max = ''
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      if sequence[i].to_i > sequence[i-1].to_i
        count += 1
        subsequence += sequence[i]
      else
        if count > 1
          rising_subsequences[n] = subsequence
          max = subsequence if subsequence.length > max.length
          n += 1
        end
        count = 1
        subsequence = sequence[i]
      end
    end
    [rising_subsequences, max]
  end
end