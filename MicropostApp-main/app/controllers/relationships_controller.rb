class RelationshipsController < ApplicationController
  def create
    @followed_user = User.first
    @relationship = Relationship.new(follower_id: params[:followed_id], followed_id: @followed_user.id)
    @relationship.save
    redirect_to action: "show", id: params[:followed_id]
    end
  def destroy
    @followed_user = User.first
    @relationship = Relationship.find_by(follower_id: params[:id], followed_id: @followed_user.id)
    @relationship.delete
    redirect_to action: "show", id: params[:id]
  end
end
