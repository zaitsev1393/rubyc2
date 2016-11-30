ActiveAdmin.register User do
  permit_params :email, :password, categories: []


  index do
    column :id
    column :email do |user|
      link_to user.email, admin_user_path(user.id)
    end
    column :created_at
    column :last_sign_in_at
    column :last_sign_out_at
    column :comments do |user| 
      user.comments.count
    end
    column :likes do |user| 
      user.likes.count
    end
  end
  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

