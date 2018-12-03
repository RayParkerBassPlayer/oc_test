class ShingleConnection
  include HTTParty

  # Being written as a static class, the base_uri call does not work...
  # base_uri = "https://mdms.owenscorning.com/api/v1/product/shingles"
  # ...so mimic its general look and feel for this exercise.
  @base_uri = "https://mdms.owenscorning.com/api/v1/product/shingles"

  private

  # Wrap the uglier part of the call so that other calls simply involve supplying query options.
  def self.call_api(query)
    JSON.parse(self.get(@base_uri, :query => query).body)
  end

  public

  def self.shingles(query = {})
    default_query = {
        :zip => "43659"
    }

    call_api(default_query.merge(query))
  end
end
