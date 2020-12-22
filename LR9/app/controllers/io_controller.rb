# frozen_string_literal: true

# output
# :reek:TooManyStatements
# :reek:UncommunicativeVariableName
# :reek:UtilityFunction
# :reek:IrresponsibleModule
# :reek:FeatureEnvy
# :reek:InstanceVariableAssumption
class IoController < ApplicationController
  def result
    sequence = params[:sequence]
    @result = 'hello'

    if sequence == ''
      @result = 'you did not write anything:('
    elsif sequence.to_i.zero?
      @result = 'please, enter a number'
    else
      res = find(sequence)
      @result = if res.length.zero?
                  'There are no rising subsequences'
                else
                  res
                end
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                   { type: @result.class.to_s, value: @result }
      end
    end
  end

  def find(sequence)
    rising_subsequences = []
    subsequence = sequence[0]
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      current_sequence = sequence[i]
      if current_sequence.to_i > sequence[i - 1].to_i
        count += 1
        subsequence += current_sequence
      else
        if count > 1
          rising_subsequences[n] = subsequence
          n += 1
        end
        count = 1
        subsequence = current_sequence
      end
    end
    rising_subsequences
  end
end
