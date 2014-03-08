ActiveAdmin.register IngredientCategory do
  permit_params :name, :ingredient_category_id
  index do
    selectable_column
    id_column
    column :name
    column :updated_at
    column :created_at
    actions
  end

  filter :name
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
    end
    f.actions
  end

end