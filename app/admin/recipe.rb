ActiveAdmin.register Recipe do
  permit_params :title, :url, :thumbnail
  index do
    selectable_column
    id_column
    column :title
    column :url
    column :thumbnail
    column :updated_at
    column :created_at
    actions
  end

  filter :title
  filter :url
  filter :thumbnail
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :url
      f.input :thumbnail
    end
    f.actions
  end

end