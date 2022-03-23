class MotivationController < ApplicationController
  def index
    @motivations = Motivation.all
  end

  def create
    @motivation = Motivation.new
  end
end
