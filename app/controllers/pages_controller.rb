class PagesController < ApplicationController
    
    def home  
    end

    def dummypage
    end

    def guides
        @users = User.all
    end
end
