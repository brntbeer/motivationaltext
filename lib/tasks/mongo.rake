#use this for running rake test tasks properly,
#see http://johnpwood.net/2010/04/13/getting-rake-test-running-with-rails-3-and-mongodb/
#for more details
namespace :db do
  namespace :test do
    task :preare do
      #stub out for mongoDB
    end
  end
end
