class ContentController < ApplicationController

  def home
    @title = 'FYGP'
    @greeting = 'hi'
    @intro = '#this is the default route, which leads to the controller action home controllers are the glue between models and views in an MVC architecture'
  end

end
