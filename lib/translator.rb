require "yaml"
require "pry"


def load_library(filename)
  meaning = {}
  emoticon = {}

  combined = {"get_meaning" => meaning, "get_emoticon" => emoticon}
  hash = YAML.load_file(filename)

  hash.each do |english_word, emoticons|
    combined["get_meaning"][emoticons[1]] = english_word;
    combined["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  return combined
end



def get_japanese_emoticon(filepath, emoticon)
  temp = load_library(filepath)["get_emoticon"][emoticon]
  if temp == nil
    return "Sorry, that emoticon was not found"
  else
    return temp
  end
end

def get_english_meaning(filepath, emoticon)
  temp = load_library(filepath)["get_meaning"][emoticon]
  if temp == nil
    return "Sorry, that emoticon was not found"
  else
    return temp
  end
end
