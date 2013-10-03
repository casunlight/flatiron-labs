# Author: Manuel Neuhauser
# Date : 9/30/2013
# Email: manuel.neuhauser@flatironschool.com
 
movies = {
  "Crime"   => ["The Godfather", "The Place Beyond the Pines"],
  "Drama"   => ["Citizen Kane", "Trainspotting"],
  "Comedy"  => ["Coming to America", "Wedding Crashers"],
  "Foreigh" => ["Run Lola Run (Lola Rennt)", "Amour"]
}

recipes = {
  "Paleo Pancake" => [
    { "banana" => "2" },
    { "eggs"   => "4" },
    { "almond butter" => "2 tbsp" }
  ],
  "Peanut Butter Sandwich" => [
    { "slice of bread" => "2" },
    { "peanut butter"  => "1 tbsp" },
    { "grape jelly"    => "1 tbsp" }
  ]
}



profiles = [
  { username: "manuel", 
    color:    ["blue"], 
    essays:   ["essay_1", "essay_2", "essay_3"]
  },
  { username: "logan", 
    color:    ["orange"], 
    essays:   ["essay_4", "essay_5", "essay_6"]
  },
  { username: "matt", 
    color:    ["green"], 
    essays:   ["essay_7", "essay_8", "essay_9"]
  }
]



def reverse_each_word(sentence)
  sentence.split.map do |word|
    word.reverse
  end.join(" ")
end

