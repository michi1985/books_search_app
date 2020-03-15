# frozen_string_literal: true

require 'rakuten_web_service/client'
require 'rakuten_web_service/search_result'

module RakutenWebService
  class Resource
    attr_reader :params

    class << self
      def attribute(*attributes)
        attributes.each do |attribute|
          method_name = attribute.to_s.gsub(/([a-z]+)([A-Z]{1})/, '\1_\2').downcase
          method_name = method_name.sub(/^#{resource_name}_(\w+)$/, '\1')
          instance_eval do
            define_method method_name do
              get_attribute(attribute.to_s)
            end
          end
          next if method_name !~ /(.+)_flag$/
          instance_eval do
            define_method "#{$1}?" do
              get_attribute(attribute.to_s) == 1
            end
          end
        end
      end

      def search(options)
        SearchResult.new(options, self)
      end

      def all(options, &block)
        if block
          search(options).all(&block)
        else
          search(options).all
        end
      end

      def resource_name
        @resource_name ||= name.split('::').last.downcase
      end

      def set_resource_name(name)
        @resource_name = name
      end

      def endpoint(url = nil)
        @endpoint = url || @endpoint
      end

      def client
        @client ||= RakutenWebService::Client.new(endpoint)
      end

      def set_parser(&block)
        instance_eval do
          define_singleton_method :parse_response, block
        end
      end
    end

    def initialize(params)
      @params = {}
      params.each { |k, v| @params[k.to_s] = v }
    end

    def [](key)
      camel_key = key.split('_').map(&:capitalize).join
      camel_key[0] = camel_key[0].downcase
      @params[key] || @params[camel_key]
    end

    def get_attribute(name)
      @params[name.to_s]
    end

    def attributes
      params.keys
    end

    def ==(other)
      raise ArgumentError unless other.is_a?(RakutenWebService::Resource)

      params.keys.all? do |k|
        @params[k] == other.params[k]
      end
    end
  end
end
