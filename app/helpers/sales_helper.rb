module SalesHelper
  def associated_recipe_radios
    fomatted_recipes = Recipe.all.map do |r|
      Struct.new("Recipe", :id, :photo, :name)
      Struct::Recipe.new(r.id, url_for(r.photo), r.name)
    end

    i = 0
    collection_radio_buttons(:sale, :recipe_id, fomatted_recipes, :id, :name) do |f|
      f.label do
        photo = fomatted_recipes[i].photo
        i += 1

        concat f.radio_button
        concat image_tag photo
        concat f.text
      end
    end
  end
end
