# app/views/stories/index.atom.builder
atom_feed do |feed|
  feed.title("NCC-1701D")
  feed.updated(@feeds.first.updated_at) #.strftime("%Y-%m-%dT%H:%M:%SZ"))

  for story in @feeds
    next if story.updated_at.blank?
    feed.entry([ story]) do |entry|
      entry.title(story.name)
      entry.description(story.description)
      entry.url(story.link)
      entry.content(story.link, :type => 'html')
      entry.updated(story.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) # needed to work with Google Reader.      
    end
  end
end