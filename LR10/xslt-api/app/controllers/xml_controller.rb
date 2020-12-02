class XmlController < ApplicationController
  before_action :parse_params, only: :index

  def index
      #sequence = params[:sequence]
      result =''
      if @sequence == ''
        result = 'you did not write anything:('
      elsif @sequence.to_i.zero?
        result = 'please, enter a number'
      else
        res = find(@sequence)
        if res[0].length.zero?
          result = 'There are no rising subsequences'
        else
          max = res[1]
          result = res[0].map { |elem| { subsequence: elem.to_s } }
                      .append({ max: max.to_s })

        end
      end

      respond_to do |format|
        format.xml { render xml: result.to_xml }
        format.rss { render xml: result.to_xml }
      end
  end

  protected

  def parse_params
    @sequence = params[:sequence]
  end

  def find(sequence)
    rising_subsequences = []
    subsequence = sequence[0]
    max = ''
    count = 1
    n = 0
    (1..sequence.length).each do |i|
      if sequence[i].to_i > sequence[i - 1].to_i
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