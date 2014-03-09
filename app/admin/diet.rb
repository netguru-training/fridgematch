ActiveAdmin.register NutritionalValue do
  permit_params :name, :description, :protein, :fat, :carbohydrates, :calories
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :protein
    column :fat
    column :carbohydrates
    column :calories
    column :updated_at
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :protein
  filter :fat
  filter :carbohydrates
  filter :calories
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :description
      f.input :protein
      f.input :fat
      f.input :carbohydrates
      f.input :calories
    end
    f.actions
  end

end