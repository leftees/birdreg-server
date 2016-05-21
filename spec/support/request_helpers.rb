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
          @data = { 
            "_id" => json['id'].to_i, 
            "_type" => json['type'] 
          }
          if json && json['attributes']
            @data.merge!(json['attributes'])
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
      
      class JsonApiList
        def initialize(json_array)
          @list = Hash.new({})
          @list_array = []
          if json_array
            json_array.each do |incl| 
              data = JsonApiData.new(incl)
              @list["#{incl['type']}:#{incl['id']}"] = data
              @list_array << data
            end
          end
        end
        
        def [](key_index_or_object)
          if key_index_or_object.kind_of?(ActiveRecord::Base)
            obj_id = key_index_or_object.id
            obj_type = key_index_or_object.class.name.tableize.dasherize
            return @list["#{obj_type}:#{obj_id}"]
          elsif key_index_or_object.kind_of?(Integer)
            return @list_array[key_index_or_object]
          else
            return @list[key]
          end
        end
        
        def method_missing(name, *args)
          if name.to_s[/^(\s)_(\d)$/]
            return @list["#{$1}:${$2}"]
          else
            super
          end
        end
      end
      
      def initialize(json)
        @json = json
        if @json['data'].kind_of?(Array)
          @jsonapidata = JsonApiList.new(@json['data'])
        else
          @jsonapidata = JsonApiData.new(@json['data'])
        end
        @jsonapiincluded = JsonApiList.new(@json['included'])
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
