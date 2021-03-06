require 'open-uri'
require 'json'

    count = 0

    file_log = File.open("photos", "w")
    url = "https://graph.facebook.com/381951238617677?fields=photos"
    first_page_posts = JSON.parse(open(URI.encode(url)).read)

    #first page (special case)

    first_page_posts['photos']['data'].each do |post|
      puts post['images'][0]['source']
      file_log.puts post['images'][0]['source']
      count = count + 1
      puts "#{count} photos downloaded"
    end

    #succceeding pages

    page_posts = {}
    page_posts['paging'] = {}
    page_posts['paging']['next'] = first_page_posts['photos']['paging']['next']

    while !page_posts['paging'].nil?
      puts "fetching next page of photos..."
      page_posts = JSON.parse(open(URI.encode(page_posts['paging']['next'])).read)
      page_posts['data'].each do |post|
        puts post['images'][0]['source']
        file_log.puts post['images'][0]['source']
        count = count + 1
        puts "#{count} photos downloaded"
      end
    end
