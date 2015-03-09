module Hobbit
  module Mote

    # Allows for params[:key], redirect 'path' shortcuts in Hobbit
    # Also modifies file structure to my liking.

    def params
      @params ||= create_proper_hash(request.params)
    end

    def create_proper_hash(pre_hash)
      params_hash = symbol_indifferent_hash
      pre_hash.each { |key, value| params_hash[key] = value }
      params_hash
    end

    def symbol_indifferent_hash
      Hash.new {|value,key| value[key.to_s] if Symbol === key }
    end

    def redirect(path)
      response.redirect(path)
    end

    def default_layout
      "#{layouts_path}/layout.mote"
    end

    def layouts_path
      "#{views_path}"
    end

    def views_path
      'app/views'
    end

  end
end
