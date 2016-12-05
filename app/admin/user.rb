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

end

