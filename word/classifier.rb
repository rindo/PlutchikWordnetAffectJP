module Word
  class Classifier

    require 'csv'

    # public ----------------------------------------------------------------

    def initialize
      @vocabularies = load_vocabularies
    end

    def classify(word)
      @vocabularies.each do |k, v|
        return k if v.include?(word)
      end
      return nil
    end

    private # ---------------------------------------------------------------

    def load_vocabularies
      ret = {}
      Dir["#{vocabularies_dir}/*.csv"].each do |_|
        key   = File.basename(_, '.csv')
        words = CSV.read(_).flatten
        ret[key] = words
      end
      ret
    end

    def vocabularies_dir
      "#{File.dirname(__FILE__)}/vocabulary"
    end

  end
end