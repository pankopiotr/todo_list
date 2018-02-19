module API
  module V1
    class Todolists < Grape::API
      include API::V1::Defaults

      resource :todolists do
        desc 'Returns all public and self-owned todolists'
        get '/' do
          # Not really self-owned as there is no api authentication yet
          todolists = Todolist.unrestricted
          todolists ? todolists : raise(ActiveRecord::RecordNotFound)
        end
        
        desc 'Return specific todolist along with tasks if public or self-owned'
        params do
          requires :id, type: Integer, desc: 'Todolist ID'
        end
        get ':id' do
          todolist = Todolist.find_by(id: params[:id], private: false)
                            .as_json(only: %i[id name private], 
                                      methods: :count_tasks,
                                      include: { user: { only: :nickname },
                                                tasks: { only: %i[title 
                                                                  description] } 
                                              }
                                    )
          todolist ? todolist : raise(ActiveRecord::RecordNotFound)
        end

        desc 'Create new todolist'
        params do
          requires :name, type: String, allow_blank: false
          requires :user_id, type: Integer, allow_blank: false
          optional :private, type: Boolean, allow_blank: false
        end
        post '/' do
          todolist = Todolist.create(permitted_params)
          todolist ? todolist : raise(ActiveRecord::RecordInvalid)
        end

        desc 'Delete todolist if self-owned'
        params do
          requires :id, type: Integer, desc: 'Todolist ID'
        end
        delete ':id' do
          # Not really self-owned as there is no authentication yet
          todolist = Todolist.find_by(id: params[:id])
          todolist ? todolist.destroy : raise(ActiveRecord::RecordNotFound)
        end

      end

    end
  end
end