File.open(File.join(RAILS_ROOT, 'config/mongoid.yml'), 'r') do |f|
  @settings = YAML.load(f)[RAILS_ENV]
end


Mongoid.configure do |config|
  name = @settings["database"]
  host = @settings["host"]
  config.master = Mongo::Connection.new(host, 27017, :logger => Rails.logger).db(name)

end
