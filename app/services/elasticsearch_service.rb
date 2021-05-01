class ElasticsearchService

  def find_data
    client = Elasticsearch::Client.new(
      url: 'elasticsearch',
      log: true
    )

    client.search(index: 'index01', body: build_query)
  end

  def build_query
    {
      query: {
        match_all: {}
      },
      size: 1000
    }
  end
end
