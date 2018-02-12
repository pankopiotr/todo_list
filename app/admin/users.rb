ActiveAdmin.register User do
  permit_params %i[nickname email favourite_color password password_confirmation]
  actions :all, except: [:destroy]

  menu priority: 2

  filter :nickname
  filter :email
  filter :favourite_color
  filter :created_at
  filter :todolists, label: 'Author of [todolist]'

  index as: :table do
    selectable_column
    id_column
    column :nickname
    column :favourite_color
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :nickname
      f.input :email
      f.input :favourite_color, as: :string
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    actions
  end
end