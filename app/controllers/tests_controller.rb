class TestsController < ApplicationController
  def index
    @tests = Test.all
    render :index, layout: false
  end
end
