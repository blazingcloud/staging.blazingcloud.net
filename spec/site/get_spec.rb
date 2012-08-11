require 'spec_helper'
describe Site do
    def app
      app_instance  = Site.prepare_instance
    end
  context "before" do
    it "sets @title" do
      get "/"
      app.instance_variable_get("@title").should match("Blazing Cloud | Mobile Product Development")
    end
  end

  context "get /" do
    before do
      get "/"
    end

    it "sets @pagename" do
      app.instance_variable_get("@pagename").should == 'home'
    end

    it "is ok" do
      last_response.should be_ok
    end

  end
  context "get /services" do
    before do
      get "/services"
    end
    it "sets @pagename" do
      app.instance_variable_get("@pagename").should == 'services'
    end
    it "is ok" do
      last_response.should be_ok 
    end
  end
  context "get /service" do
    before do
      get "/service"
    end
    it "sets @pagename" do
      app.instance_variable_get("@pagename").should == 'services'
    end
    it "redirect to /services" do
      last_response.headers['Location'].should match('/services')
    end
  end
  context "get /blog" do
    it "redirects to http://blog.blazingcloud.net" do
      get '/blog'
      last_response.headers['Location'].should == %%http://blog.blazingcloud.net%
    end
  end
  
  
   context "get /portfolio" do
    before do
      get "/portfolio"
    end
    it "sets @pagename" do
      app.instance_variable_get("@pagename").should == 'portfolio'
    end
    it "is ok" do
      last_response.should be_ok 
    end
  end
  
  context "get /portfolio" do
    before do
        get "/portfolio"
    end
    it "sets @pagename"do
        app.instance_variable_get("@pagename").should == 'portfolio'
    end
    it "redirect to /portfolio" do
        last_response.should be(200)
    end
  end
  
  context "get /*" do
    %w(
      /123/moo/cat
      /moo/cat
      /cat
      ).each  do |path|
        it "#{path }redirects to http://blog.blazingcloud.net#{path}" do
          get path
          last_response.headers['Location'].should match(%r{#{path}$})
        end
      end
  end
end
