class PostsController < ApplicationController
    def index
        render json: Post.all
    end
    
    def create
        post = Post.create(caption: post_params["caption"])
        post.avatar.attach(post_params["file"])
        post.photo_url = url_for(post.avatar)
        if post.save
            render json: post
        else 
            render json: {
                error: "Not Workin"
            }
    end
end

    private
    def post_params
        params.permit(:file,:caption, :likes)
    end
end


