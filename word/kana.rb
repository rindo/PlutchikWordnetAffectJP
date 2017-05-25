module Word
  module Kana extend self

    require 'natto'
    require 'nkf'

    # consts ----------------------------------------------------------------

    CHAR_TYPE = {
      KANJI:     2,
      KATAKANA:  7
    }

    # public ----------------------------------------------------------------

    def kana(word)
      tmp = []
      client.parse(word) do |n|
        next if n.is_eos?

        case n.char_type
        when CHAR_TYPE[:KANJI]
          if katakana = n.feature.split(',')[7]
            tmp << kanji_to_hiragana(katakana)
          else
            tmp << 'UNKOWN'
          end
        when CHAR_TYPE[:KATAKANA]
          tmp << katakana_to_hiragana(n.surface)
        else
          tmp << n.surface
        end
      end
      tmp.join
    end

    private # ---------------------------------------------------------------

    def client
      @_client ||= Natto::MeCab.new
    end

    def kanji_to_hiragana(kanji)
      NKF.nkf('-h1 -w', kanji)
    end

    def katakana_to_hiragana(katakana)
      NKF.nkf('-w --hiragana', katakana)
    end

  end
end