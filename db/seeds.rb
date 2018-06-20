cities_list = {
    "Chicago" => {
    },
    "Vancouver" => {
    },
    "Boston" => {
    },
    "Dublin" => {
    }
  }

cities_list.each do |name, city_hash|
  p = City.new
  p.name = name
  #landmark_hash.each do |attribute, value|
  #    p[attribute] = value
  #end
  p.save
end

figure_list = {
    "Billy The Kid" => {
    },
    "Mark Zuckerberg" => {
    },
    "Ada Lovelace" => {
    },
    "Linus Torvalds" => {
    }
  }

figure_list.each do |name, figure_hash|
  p = Figure.new
  p.name = name
  p.save
end


title_list = {
    "The Mayor" => {
    },
    "The Don" => {
    },
    "Mr. President" => {
    }
  }

title_list.each do |name, figure_hash|
  p = Title.new
  p.name = name
  p.save
end
