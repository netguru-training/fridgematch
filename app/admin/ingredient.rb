ActiveAdmin.register Ingredient do
  permit_params :name, :ingredient_category_id
  index do
    selectable_column
    id_column
    column :name
    column :ingredient_category_id
    column :updated_at
    column :created_at
    actions
  end

  filter :name
  filter :ingredient_category_id
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :ingredient_category_id
    end
    f.actions
  end

end