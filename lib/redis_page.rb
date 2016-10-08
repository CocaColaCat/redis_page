require 'redis_page/railtie'

module RedisPage
  class Config
    attr_accessor :sweeper, :redis, :ttl
    attr_accessor :cache_page_redis, :cache_relation_redis
  end

  def self.config
    @@config ||= Config.new
  end

  def self.configure
    yield self.config
  end

  def self.redis
    config.redis
  end

  def self.cache_page_redis
    config.cache_page_redis || config.redis
  end

  def self.cache_relation_redis
    config.cache_relation_redis || config.redis
  end

  def self.sweeper
    config.sweeper
  end
end
