# frozen_string_literal: true

require 'dalli'

class DalliClient
  def initialize(options = {})
    @options = options
  end

  def set(key:, value:)
    dalli_client.set(key, value)
  end

  def get(key:)
    dalli_client.get(key)
  end

  private

  def dalli_client
    @dalli_client ||= Dalli::Client.new(ENV['DALLI_HOST'], @options)
  end
end
