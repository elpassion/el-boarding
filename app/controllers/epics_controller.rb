class EpicsController < ApplicationController
  def index
    @epic_lists = EpicList.all.order(:created_at)
  end
end
