ActiveAdmin.register Todolist do
  permit_params %i[name private user_id]

  menu priority: 3

  scope :all, default: true
  scope('public') { |scope| scope.where(private: false) }
  scope('private') { |scope| scope.where(private: true) }
end