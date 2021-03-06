# frozen_string_literal: true

# Output controller
# :reek:UtilityFunction
# :reek:TooManyStatements
# :reek:UncommunicativeVariableName
# :reek:IrresponsibleModule
class OutputController < ApplicationController
  def output
    sequence = params[:sequence]
    @error = 1
    if sequence == ''
      @output = 'you did not write anything:('
    elsif sequence.to_i.zero?
      @output = 'please, enter a number'
    else
      @output = "Your initial sequence: #{sequence}"
      @error = 0
      res = find(sequence)
      subsequences_ = res[0]
      max = res[1]
      if subsequences_.length.zero?
        @subsequences = 'There are no rising subsequences'
        @error = 1
      else
        @subsequences = subsequences_
        @max = "maximum length rising subsequence: #{max}"
      end
    end
  end

  def find(sequence)
    rising_subsequences = []
    subsequence = sequence[0]
    max = ''
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      curr_seq = sequence[i]
      if curr_seq.to_i > sequence[i - 1].to_i
        count += 1
        subsequence += curr_seq
      else
        if count > 1
          rising_subsequences[n] = subsequence
          max = subsequence if subsequence.length > max.length
          n += 1
        end
        count = 1
        subsequence = curr_seq
      end
    end
    [rising_subsequences, max]
  end

  def users
    respond_to do |format|
      res = User.all
      format.xml {render xml: res}
      format.json {render json: res}
    end
  end
end
