namespace :assets do
  desc "Display asset path"
  task :paths => :environment do
    Rails.application.config.assets.each do |asset|
      puts asset.inspect
    end
  end
end