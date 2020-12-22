# frozen_string_literal: true

# Output controller
# :reek:TooManyStatements
# :reek:InstanceVariableAssumption
class XmlController < ApplicationController
  before_action :parse_params, only: :index


  def index
    result = ''
    sequence = @sequence
    if sequence == ''
      result = 'you did not write anything:('
    elsif sequence.to_i.zero?
      result = 'please, enter a number'
    else
      res = find(sequence)
      rising_subsequences = res[0]
      if rising_subsequences.length.zero?
        result = 'There are no rising subsequences'
      else
        max = res[1]
        result = rising_subsequences.map { |elem| { subsequence: elem.to_s } }
                       .append(max: max.to_s)

      end
    end

    respond_to do |format|
      res = render xml: result.to_xml
      format.xml { res }
      format.rss { res }
    end
  end

  protected

  def parse_params
    @sequence = params[:sequence]
  end

  # :reek:UncommunicativeVariableName
  # :reek:UtilityFunction
  def find(sequence)
    rising_subsequences = []
    subsequence = sequence[0]
    max = ''
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      seq_i = sequence[i]
      if seq_i.to_i > sequence[i - 1].to_i
        count += 1
        subsequence += seq_i
      else
        if count > 1
          rising_subsequences[n] = subsequence
          max = subsequence if subsequence.length > max.length
          n += 1
        end
        count = 1
        subsequence = seq_i
      end
    end
    [rising_subsequences, max]
  end
end
