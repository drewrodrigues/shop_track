module SalesHelper
  def associated_recipe_radios
    fomatted_recipes = Recipe.all.map do |r|
      Struct.new("Recipe", :id, :photo, :name)
      photo_url = r.photo.attached? ? url_for(r.photo) : nil
      Struct::Recipe.new(r.id, photo_url, r.name)
    end

    i = 0
    collection_radio_buttons(:sale, :recipe_id, fomatted_recipes, :id, :name) do |f|
      f.label do
        photo = fomatted_recipes[i].photo
        i += 1

        concat f.radio_button
        concat image_tag photo if photo
        concat f.text
      end
    end
  end
end
