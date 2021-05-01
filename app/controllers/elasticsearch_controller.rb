class ElasticsearchController < ApplicationController
  def index
    @results = ElasticsearchService.new.find_data
  end
end
