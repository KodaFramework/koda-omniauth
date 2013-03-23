require 'sinatra/base'
require 'omniauth'
require 'koda-content/models/user'

module Koda
  module Auth
    class OmniAuthIntegration < Sinatra::Base
      use Rack::Session::Cookie

      get '/auth/:provider/callback/?' do
        if env['omniauth.auth'].nil?
          redirect normalise_path '/auth/login?error=authentication_failed'
        else
          auth = request.env['omniauth.auth']
          user = Koda::User.create_or_load provider: auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email
          session[:user_id] = user._id
          redirect normalise_path '/'
        end
      end

      def normalise_path(path)
        prefix = request.script_name
        "#{prefix}#{path}"
      end

      def requires_authentication(request)
        not request.path.start_with? normalise_path '/auth'
      end

      before do
        if requires_authentication request
          if session[:user_id]
            user = User.find(session[:user_id])
            env['koda_user'] =  user
          else
            redirect normalise_path '/auth/login'
          end
        end
      end

      get '/auth/login' do
        erb :login, layout: :layout
      end

      get '/auth/logout' do
        session[:user_id] = nil
        redirect normalise_path '/auth/login'
      end
    end
  end
end