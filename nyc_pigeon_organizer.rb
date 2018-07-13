pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

# pigeon_list = {"name" => {:color=>[],:gender=>[],:lives=>[]} }

def get_pigeon_list_template(pigeon_data)

  pigeon_names = []
  pigeon_list= {}

  pigeon_data.each do |attribute,key_value_pairs|
    key_value_pairs.each do |symbol,name_array|
      name_array.each do |name|
        pigeon_names << name
      end
    end
  end

  unique_pigeon_names = pigeon_names.uniq
  unique_pigeon_names.each do |unique_name|
    pigeon_list[unique_name] = {:color=>[],:gender=>[],:lives=>[]}
  end

  return pigeon_list

end

def nyc_pigeon_organizer(pigeon_data)

  pigeon_list = get_pigeon_list_template(pigeon_data)

  pigeon_data.each do |attribute,category_pairs_object|
    category_pairs_object.each do |category,name_array|
      name_array.each do |name|
        pigeon_list.each do |unique_name,attributes_object|
          if name == unique_name
            pigeon_list[unique_name][attribute] << category.to_s
          end
        end
      end
    end
  end
  return pigeon_list
end
