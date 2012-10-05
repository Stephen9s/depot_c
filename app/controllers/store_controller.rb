class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    
    if cookies['last_visited_str'].nil?
      
      time = Time.now
      time_int = time.to_i
       
      cookies['last_visited_int'] = {
        :value => time_int,
        :expires => 120.days.from_now
      }
      
      cookies['last_visited_str'] = {
        :value => time.to_s(:db),
        :expires => 120.days.from_now
      }
    else
      current_time = Time.now.to_i
      past_time = cookies[:last_visited_int].to_i
      
      @diff = (current_time - past_time)
      
      unless @diff.to_i < 1036800
        @time_diff = "Last visited 120 days ago!"
      end
    end
    
  end
end
