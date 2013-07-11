require "raredio/version"
require 'json'
require 'ostruct'
require 'faraday'

module Raredio
  class ClientLibrary
    attr_reader :key, :conn

    def initialize(key = "alphabravodonkey")
      @key = key
      @conn = connection
    end

    def song(id)
      request(:get, song_uri(id), access_token: key)
    end

    def songs
      request(:get, songs_uri, access_token: key)
    end

    def create(url)
      response = conn.post do |req|
        req.url songs_uri, access_token: key
        req.headers['Content-Type'] = 'application/json'
        req.body = {song: {url: url}}.to_json
      end
      parse_response(response)
    end

    def request(verb, url, args = {})
      response = conn.send(verb) do |req| 
        req.url url, args
        req.headers['Content-Type'] = 'application/json'
      end
      parse_response(response)
    end


  private

    def songs_uri
      "/api/songs.json"
    end

    def song_uri(id)
      "/api/song/#{id}.json"
    end

    def connection
      conn = ::Faraday.new(:url => root_url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
      conn
    end

    def parse_response(response)
      if response.status == 200
        JSON.parse(response.body)
      elsif response.status == 404
        nil
      else
        raise response.body
      end
    end

    def root_url
      "http://raredio.herokuapp.com/"
    end
  end

  class SongProxy < OpenStruct
  end
end
