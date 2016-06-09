class ApiController < ApplicationController

  def index
    result1 = Yelp.client.search('9120 N Lincoln Ave, Des Plaines, IL 60016', {term: 'tacos', radius_filter: 11000}).businesses
    result2 = Yelp.client.search('5805 W Cullom, Chicago, IL', {term: 'tacos', radius_filter: 11000}).businesses
    result2_urls = result2.map {|biz| biz.url}

    final_results = result1.select {|biz| result2_urls.include?(biz.url)}

    render json: final_results

  end

end
