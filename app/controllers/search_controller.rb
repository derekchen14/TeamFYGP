class SearchController < ApplicationController

  def search
    @title = 'Search'
  end

  def display
    @title = 'Search by '
  end

end