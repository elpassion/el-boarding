class EpicsController < ApplicationController
  def index
    @epic_lists = EpicList.all
  end
end
