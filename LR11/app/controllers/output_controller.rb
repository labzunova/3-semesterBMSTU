# frozen_string_literal: true

# Output controller
# :reek:TooManyStatements
# :reek:UncommunicativeVariableName
# :reek:InstanceVariableAssumption
# :reek:UtilityFunction
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
      if (res = Output.find_by_input(sequence))
        @subsequences = ActiveSupport::JSON.decode(res.result)
        @max = ActiveSupport::JSON.decode(res.max)
      else
        res = find(sequence)
        rising_subsequences = res[0]
        if rising_subsequences.length.zero?
          @subsequences = 'There are no rising subsequences'
          @error = 1
        else
          @subsequences = rising_subsequences
          @max = "maximum length rising subsequence: #{res[1]}"
          res = Output.create input: sequence, result: ActiveSupport::JSON.encode(@subsequences), max: ActiveSupport::JSON.encode(@max)
          res.save
        end
      end
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type_result: @subsequences.class.to_s, value_result: @subsequences }
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

  def results
    respond_to do |format|
      res = Output.all
      format.xml {render xml: res}
      format.json {render json: res}
    end
  end

  def all
    respond_to do |format|
      format.xml { render xml: Output.all.to_xml }
    end
  end
end
