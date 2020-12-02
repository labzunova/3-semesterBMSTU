# frozen_string_literal: true

# output
class IoController < ApplicationController
  def output
    sequence = params[:sequence]
    @result = "hello"

    if sequence == ''
      @result = 'you did not write anything:('
    elsif sequence.to_i.zero?
      @result = 'please, enter a number'
    else
      res = find(sequence)
      if res.length.zero?
        @result = 'There are no rising subsequences'
      else
        @result = res
      end
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                   {type: @result.class.to_s, value: @result}
      end
    end
  end

  def find(sequence)
    rising_subsequences = []
    subsequence = sequence[0]
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      if sequence[i].to_i > sequence[i - 1].to_i
        count += 1
        subsequence += sequence[i]
      else
        if count > 1
          rising_subsequences[n] = subsequence
          n += 1
        end
        count = 1
        subsequence = sequence[i]
      end
    end
    rising_subsequences
  end
end
