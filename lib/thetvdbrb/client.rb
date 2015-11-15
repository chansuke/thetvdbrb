module Thetvdbrb
  class Client
    attr_reader :token, :seriesName

    def initialize(seriesName)
      @token = API_KEY
      @seriesName = seriesName
      if @seriesName.empty? || @token.empty?
        raise ArgumentError, 'SeriesName or Token are empty'
      end
    end

    def get_show
      result = ResultClient.get 'http://thetvdb.com/api/GetSeries.php?seriesname=' + @seriesName
      doc = Nokogiri::XML(result)
      seriesId = doc.at('seriesid').text
      series_data = ResultClient.get 'http://thetvdb.com/api/' + @token + '/series/' + seriesId + '/all/en.xml'
      return series_data
    end
  end
end
