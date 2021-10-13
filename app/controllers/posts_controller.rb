class PostsController < ApplicationController
    def create
        binding.pry
        post = Post.new(post_params)
    end
end
