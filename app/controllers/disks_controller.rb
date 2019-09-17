class DisksController < ApplicationController
  def new
    @disk.songs.build
  end
end
