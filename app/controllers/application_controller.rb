class ApplicationController < ActionController::Base
    helper_method :current_customer
    
    def current_customer
        User.find(1) #常にid:1のユーザーを返す
    end
end

#実装完了したら上記は消すこと！