require 'feedzirra'
 
# fetching a single feed
feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")
 
# feed and entries accessors
feed.title          # => "Paul Dix Explains Nothing"
feed.url            # => "http://www.pauldix.net"
feed.feed_url       # => "http://feeds.feedburner.com/PaulDixExplainsNothing"
feed.etag           # => "GunxqnEP4NeYhrqq9TyVKTuDnh0"
feed.last_modified  # => Sat Jan 31 17:58:16 -0500 2009 # it's a Time object
 
entry = feed.entries.first
entry.title      # => "Ruby Http Client Library Performance"
entry.url        # => "http://www.pauldix.net/2009/01/ruby-http-client-library-performance.html"
entry.author     # => "Paul Dix"
entry.summary    # => "..."
entry.content    # => "..."
entry.published  # => Thu Jan 29 17:00:19 UTC 2009 # it's a Time object
entry.categories # => ["...", "..."]
 
# sanitizing an entry's content
entry.title.sanitize   # => returns the title with harmful stuff escaped
entry.author.sanitize  # => returns the author with harmful stuff escaped
entry.content.sanitize # => returns the content with harmful stuff escaped
entry.content.sanitize! # => returns content with harmful stuff escaped and replaces original (also exists for author and title)
entry.sanitize!         # => sanitizes the entry's title, author, and content in place (as in, it changes the value to clean versions)
feed.sanitize_entries!  # => sanitizes all entries in place
 
# updating a single feed
updated_feed = Feedzirra::Feed.update(feed)
 
# an updated feed has the following extra accessors
updated_feed.updated?     # returns true if any of the feed attributes have been modified. will return false if only new entries
updated_feed.new_entries  # a collection of the entry objects that are newer than the latest in the feed before update
 
# fetching multiple feeds
feed_urls = ["http://feeds.feedburner.com/PaulDixExplainsNothing", "http://feeds.feedburner.com/trottercashion"]
feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
 
# feeds is now a hash with the feed_urls as keys and the parsed feed objects as values. If an error was thrown
# there will be a Fixnum of the http response code instead of a feed object
 
# updating multiple feeds. it expects a collection of feed objects
updated_feeds = Feedzirra::Feed.update(feeds.values)
 
# defining custom behavior on failure or success. note that a return status of 304 (not updated) will call the on_success handler
feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing",
	:on_success => lambda {|feed| puts feed.title },
	:on_failure => lambda {|url, response_code, response_header, response_body| puts response_body })
# if a collection was passed into fetch_and_parse, the handlers will be called for each one
 
# the behavior for the handlers when using Feedzirra::Feed.update is slightly different. The feed passed into on_success will be
# the updated feed with the standard updated accessors. on failure it will be the original feed object passed into update
 
# You can add custom parsing to the feed entry classes. Say you want the wfw:comments fields in an entry
Feedzirra::Feed.add_common_feed_entry_element("wfw:commentRss", :as => :comment_rss)
# The arguments are the same as the SAXMachine arguments for the element method. For more example usage look at the RSSEntry and
# AtomEntry classes. Now you can access those in an atom feed:
Feedzirra::Feed.parse(some_atom_xml).entries.first.comment_rss_ # => wfw:commentRss is now parsed!
 
# You can also access http basic auth feeds. Unfortunately, you can't get to these inside of a bulk get of a bunch of feeds.
# You'll have to do it on its own like so:
Feedzirra::Feed.fetch_and_parse(some_url, :http_authentication => ["myusername", "mypassword"])
 
# Defining custom parsers
# TODO: the functionality is here, just write some good examples that show how to do this