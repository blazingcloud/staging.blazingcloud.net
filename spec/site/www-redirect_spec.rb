require 'spec_helper'
describe Site do
  context "when the host subdomain starts with www" do
    let(:scheme) do
      'cake'
    end
    let(:request_env) do
      {
        #rack supports this part of the HTTP extention
        #so i am using it to develop the tests
        'HTTP_X_FORWARDED_SCHEME'  => scheme,
        'HTTP_HOST'  => hostname,
      }
    end
    def app
      Site.new
    end

    context "redirects to host domain without www" do
      let(:hostname) do
        "www.localhost.local"
      end

      it "includes path" do
        get '/three_red_bean_dessert', {} , request_env
          last_response.headers['Location'].should match('/three_red_bean_dessert')
      end
    end

    context "redirects to host domain including path and port" do
      let(:hostname) do
        "www.hope.www.com:5000"
      end

      it "includes path" do
        get '/three_red_bean_dessert', {} ,request_env
        last_response.headers['Location'].should == "#{scheme}://hope.www.com:5000/three_red_bean_dessert"
      end
    end
  end
end

