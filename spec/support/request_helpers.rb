module Requests
  module JsonHelpers
    def json
      unless @last_response_body === response.body
        @json = nil
      end
      @last_response_body = response.body
      @json ||= JSON.parse(response.body)
    end

    def jsonapi
      @jsonapi ||= JsonApi.new(json)
    end
    
    class JsonApi
      class JsonApiData
        def initialize(json)
          @data = {}
          if json['data'] && json['data']['attributes']
            @data.merge!(json['data']['attributes'])
          end
        end
        
        def [](key)
          @data[key]
        end
        
        def method_missing(name, *args)
          if @data.keys.include?(name.to_s)
            return @data[name.to_s]
          else
            super
          end
        end
      end
      
      class JsonApiIncluded
        def initialize(json)
          @included = Hash.new({})
          if json['included']
            json['included'].each do |incl| 
              @included["#{incl['type']}:#{incl['id']}"] = JsonApiData.new({"data" => incl})
            end
          end
        end
        
        def [](key_or_object)
          if key_or_object.kind_of?(ActiveRecord::Base)
            obj_id = key_or_object.id
            obj_type = key_or_object.class.name.tableize
            return @included["#{obj_type}:#{obj_id}"]
          else
            @included[key]
          end
        end
        
        def method_missing(name, *args)
          if name.to_s[/^(\s)_(\d)$/]
            return @included["#{$1}:${$2}"]
          else
            super
          end
        end
      end
      
      def initialize(json)
        @json = json
        @jsonapidata = JsonApiData.new(@json)
        @jsonapiincluded = JsonApiIncluded.new(@json)
      end
      
      def data
        @jsonapidata
      end
      
      def included
        @jsonapiincluded
      end
    end
  end
end
