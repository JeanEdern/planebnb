ActiveAdmin.register User do

  index do
      selectable_column
      column :id
      column :email
      column :pilot
      column :profile_completed
      column :sign_in_count
      column :created_at
      column :admin
      column :provider
      actions
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
  #   permitted << :other if resource.something?
  #   permitted
  # end
end
