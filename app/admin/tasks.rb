ActiveAdmin.register Task do
  permit_params %i[title description todolist_id]

  menu priority: 4
  config.per_page = [12, 24, 48]

  scope :all
  scope("created_today") { |scope| scope.where("tasks.created_at > ?", DateTime.now - 1.day) }

  preserve_default_filters!
  filter :todolist_private, as: :select
end