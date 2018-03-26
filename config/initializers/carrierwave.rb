CarrierWave.configure do |config|
  config.storage = :file
  if Rails.env.production?
	config.asset_host = ENV["ASSET_HOST"]
  else
  	config.asset_host = "http://192.168.77.39:3000"
  end
end