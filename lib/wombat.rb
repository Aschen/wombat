#coding: utf-8

require 'wombat/crawler'

module Wombat
  class << self

    attr_reader :proxy_args, :user_agent, :user_agent_alias, :ca_file_path

    def crawl(url = nil, options = {}, &block)
      klass = Class.new
      klass.send(:include, Wombat::Crawler)
      klass.new.crawl(url, options, &block)
    end

    def configure
      yield self
    end

    def set_proxy(*args)
      @proxy_args = args
    end

    def set_user_agent(user_agent)
      @user_agent = user_agent
    end

    def set_user_agent_alias(user_agent_alias)
      @user_agent_alias = user_agent_alias
    end

    def set_ca_file_path(ca_file_path)
      @ca_file_path = ca_file_path
    end

    alias_method :scrape, :crawl
  end
end
