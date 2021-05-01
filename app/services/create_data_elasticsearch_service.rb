require 'securerandom'

class CreateDataElasticsearchService

  def process
    client = Elasticsearch::Client.new(
      url: 'elasticsearch',
      log: true
    )

    data = []
    [0,1,2,3,4,5,6,7,8,9].each do |index|
      data << {
        index: {
          _index: 'index01',
          _type: 'doc',
          _id: SecureRandom.uuid
        }
      }
      data << {
        first_name: "First name #{index} - #{SecureRandom.uuid}",
        last_name: "Last name #{index} - #{SecureRandom.uuid}",
        county: "French #{index} - #{SecureRandom.uuid}",
        age: "Age #{index} - #{SecureRandom.uuid}",
        index: "Index #{index} - #{SecureRandom.uuid}"
      }
    end

    client.bulk body: data
  end
end
