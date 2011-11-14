xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "NCC-1701D"
    xml.description "Enterprise links"
    xml.ttl "5"
    xml.link url_for(:only_path => false,
                     #:controler => 'pile',
                     :action => 'show')

    for feed in @feeds
      xml.item do
          xml.title feed.name
          xml.description feed.description
          xml.link feed.link
        end
    end
  end
end
