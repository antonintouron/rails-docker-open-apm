namespace :create_data_elasticsearch do
  task process: :environment do
    puts 'Process start...'
    CreateDataElasticsearchService.new.process
    puts 'Process end...'
    puts 'Go to Elastic web interface.'
  end
end
