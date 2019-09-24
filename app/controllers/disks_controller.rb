class DisksController < ApplicationController
before_action :authenticate_administrator!
  def new
    @disk.songs.build
  end
end
