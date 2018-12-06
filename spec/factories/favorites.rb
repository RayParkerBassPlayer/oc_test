FactoryBot.define do
  factory(:favorite) do
    url { FFaker::Internet.http_url }
    ip { FFaker::Internet.ip_v4_address }
    shingle {FFaker::Name.first_name}
    color {FFaker::Color.name}
  end
end
