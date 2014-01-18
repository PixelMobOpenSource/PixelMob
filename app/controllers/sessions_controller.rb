class SessionsController < Devise::SessionsController
    respond_to :json
    def destroy # Assumes only JSON requests
        if(current_user.auth_req) then
            auth_req = current_user.auth_req
            current_user.auth_req = nil
            current_user.save!
            LaunchKey.deauthorize(auth_req)
        end
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {'csrfParam' => request_forgery_protection_token, 'csrfToken' => form_authenticity_token }
    end
end
