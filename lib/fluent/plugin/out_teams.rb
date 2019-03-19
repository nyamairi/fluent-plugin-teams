require 'rest-client'
require 'fluent/plugin/output'

module Fluent
  module Plugin
    class TeamsOutput < Output
      Fluent::Plugin.register_output('teams', self)

      desc 'Webhook URL'
      config_param :webhook_url, :string

      desc 'Message content. Supported erb format and newline character.'
      config_param :text, :string

      def initialize
        super
      end

      def configure(conf)
        super
      end

      def start
        super
      end

      def shutdown
        super
      end

      def format(tag, time, record)
        [time, record].to_msgpack
      end

      def formatted_to_msgpack_binary?
        true
      end

      def prefer_buffered_processing
        false
      end

      def process(tag, es)
        es.each do |time, record|
          post_message(tag: tag, time: time, record: record)
        end
      end

      def write(chunk)
        tag = chunk.metadata.tag
        chunk.msgpack_each do |time, record|
          post_message(tag: tag, time: time, record: record)
        end
      end

      def post_message(args = {})
        payload = build_payload(args)
        RestClient.post(@webhook_url, payload.to_json, content_type: :json)
      end

      def build_payload(args = {})
        tag = args[:tag]
        time = args[:time]
        record = args[:record]

        text = ERB.new(@text).result(binding).gsub('\\n', "\n")
        { text: text }
      end
    end
  end
end
