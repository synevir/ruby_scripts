# coding: utf-8

# Script for analize statistics of text file:
#   total count lines
#   count characters
#   count no-space characters
#   count space characters
#   count paragraphs (split 2 empty lines)
#   average values

#-----------------------------#
#           main code         #
#-----------------------------#

# const FILE_NAME - analized file name
FILE_NAME = 'readline.rb'

# read all rows from file in to array
 lines = File.readlines(FILE_NAME) 

# count of rows in file
 line_count = lines.size

# join all rows in a string variable 'text'
 text = lines.join

# calculation count of characters, non-space characrters,spaces in 'text'
 total_characters = text.length
 spaces = text.gsub(/\S/,'').length
 total_characters_nospaces = text.gsub(/\s+/,'').length

# create arrary of word's and get a count of word's
 word_count = text.split.size

# calculate count of paragraph's and sentences
 paragraph_count = text.split(/\n\n/).size
 sentence_count  = text.split(/\.|!|\?/).size

# average values
 sentence_per_paragraph = sentence_count / paragraph_count
 word_per_sentence	= word_count / sentence_count

# out put result's analize of a file
 puts
 puts "------------ Statistic for file #{FILE_NAME} -------------------"
 puts line_count.to_s + ' lines in file/cтрок в файле'
 puts total_characters.to_s + ' characters in text/символов в тексте'
 puts total_characters_nospaces.to_s + ' non-space characters/непробельных символов'
 puts spaces.to_s + ' spaces/пробелов'
 puts paragraph_count.to_s + ' paragraph\'s / параграфa(ов)'
 puts "#{sentence_count} sentences/предложений"
 puts "cреднее количество предложений в абзаце: #{sentence_per_paragraph} sentences per paragraph (average)"
 puts "cреднее количество слов в предложении:   #{word_per_sentence} words per sentence (average)"
 puts '----------------------------------------------------------------'
