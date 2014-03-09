ActiveAdmin.register NutritionalValue do
  permit_params :name, :unit, :string, :calories, :carbohydrates, :fat, :protein, :ingredient_id
  index do
    selectable_column
    id_column
    column :name
    column :unit
    column :string
    column :calories
    column :carbohydrates
    column :fat
    column :protein
    column :ingredient_id
    column :updated_at
    column :created_at
    actions
  end

  filter :name
  filter :unit
  filter :string
  filter :calories
  filter :carbohydrates
  filter :fat
  filter :protein
  filter :ingredient_id
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :unit
      f.input :string
      f.input :calories
      f.input :carbohydrates
      f.input :fat
      f.input :protein
      f.input :ingredient_id
    end
    f.actions
  end

end