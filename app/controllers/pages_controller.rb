class PagesController < ApplicationController
    
    def home  
    end

    def dummypage
    end

    def guides
        @users = User.where(role_id: 10)
    end
end
