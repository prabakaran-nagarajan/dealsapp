class HomeController < ApplicationController

def index
# Deal.destroy_all()
 @deals = Deal.find(:all,:order => 'actualprice-discountprice desc', :limit => 5)
end

end
