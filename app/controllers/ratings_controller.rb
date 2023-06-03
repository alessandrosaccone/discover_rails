class RatingsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @rating_t = @post.ratings.find_by(user_id: current_user.id)
        if @rating_t
            return
        end

        @rating = @post.ratings.build(user_id: current_user.id, post_id: @post.id,rating_score: params[:rating_score])
        if @rating.save
            render json: {message: "Rating updated"}
        else
            render json: {error: "Error rating"}
        end
    end

    def update
    
        rating = Rating.find(params[:id])
        if rating.update(rating_score: params[:rating_score])
            render json: {message: "Rating updated"}
        else
            render json: {error: "Error rating"}
        end
    end

    def destroy
    end

    private
    def rating_params
        params.permit(:rating_score, :id)
    end
end
