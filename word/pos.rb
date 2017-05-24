module Word
  module Pos extend self

    VERB      = 'verb'
    NOUN      = 'noun'
    ADVERB    = 'adverb'
    ADJECTIVE = 'adjective'
    UNKNOWN   = 'unknown'

    def convert(pos)
      case pos
      when 'a' then ADJECTIVE
      when 'r' then ADVERB
      when 'n' then NOUN
      when 'v' then VERB
      else UNKNOWN
      end
    end

  end
end