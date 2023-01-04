class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    layout :layout_by_resource

    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

    protected
    def layout_by_resource
        if devise_controller?
        "devise"
        else
        "application"
        end
    end
end
