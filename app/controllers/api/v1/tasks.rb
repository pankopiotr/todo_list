module API
  module V1
    class Tasks < Grape::API
      include API::V1::Defaults
      
      resource :todolists do
        route_param :todolist_id do
          resource :tasks do

            desc 'Create new task for self-owned todolist'
            params do
              requires :title, type: String, allow_blank: false
              optional :description, type: String
            end
            post '/' do
              # Not really self-owned as there is no api authentication yet
              todolist = Todolist.find_by(id: params[:todolist_id])
              if todolist
                task = todolist.tasks.create(permitted_params)
                task ? task : raise(ActiveRecord::RecordInvalid)
              else
                raise(ActiveRecord::RecordNotFound)
              end
            end

          end
        end
      end
      
    end
  end
end