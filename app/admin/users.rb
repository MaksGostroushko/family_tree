ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user, :of, :name, :second_name, :email, :image, :password, :collaborators
form title: 'A custom title' do |f|
    inputs 'Details' do
      input :name
      input :email
      input :second_name
      input :password
      input :image, as: :file
    end
    actions
  end

  index do
    id_column
    column :name
    column :email
    column :second_name
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :second_name
      row :image do
        div do
          if user.image.present?
            # user.image.each do |img|
              # div do
                # image_tag(img.url(:thumb))
                image_tag(user.image.small.url)
                # end
              # end
            end
          end
        end
      row :created_at
      row :updated_at
    end
  end
end
