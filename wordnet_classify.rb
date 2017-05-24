require 'csv'
require 'rexml/document'
require './word/classifier'
require './word/pos'

# functions -----------------------------------------------------------------

def classifier
  @_classifier ||= Word::Classifier.new
end

def xml
  @_xml ||= REXML::Document.new(open('resources/jpn-asynset.xml'))
end

# parse wordnet affect ------------------------------------------------------

ok_rows = []
ng_rows = []

xml.elements.each('syn-list/noun-syn-list/noun-syn') do |noun_syn|

  cat = noun_syn['categ']
  noun_syn.elements.each('jpn-word') do |_|
    word = _['lemma']
    pos  = Word::Pos.convert(_['pos'])

    if key = classifier.classify(cat)
      ok_rows << [key, word, pos, cat]
    else
      ng_rows << [cat, word, pos]
    end
  end
end

# save to csv ---------------------------------------------------------------

CSV.open('dest/ok.csv', 'w') do |csv|
  csv << ['emotion', 'word', 'pos', 'cat']
  ok_rows.each{|_| csv << _}
end

CSV.open('dest/ng.csv', 'w') do |csv|
  csv << ['cat', 'word', 'pos']
  ng_rows.each{|_| csv << _}
end