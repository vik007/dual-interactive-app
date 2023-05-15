require "uri"
require "json"
require "net/http"
class Designation

  def initialize(arg = nil, **args)
    arg.nil? ? custom_accessor(args) : custom_accessor(arg)
  end

  def self.create(**args)
    obj = Designation.call(action: 'create', data: args)
    Designation.new(obj)
  end

  def update(**args)
    obj = Designation.call(action: 'update', data: args.merge(id: id) )
    custom_accessor(obj)
  end

  def self.where(**args)
    obj = Designation.call(action: 'where', data: args)
    if obj.class.name == 'Array'
      obj.map { |x| Designation.new(x) }
    else
      Designation.new(obj)
    end
  end

  def destroy
    obj = Designation.call(action: 'destroy', data: { id: id } )
    custom_accessor(obj)
  end

  private

  def custom_accessor(args)
    args.each do |k, v|
      singleton_class.class_eval { attr_accessor "#{k}" }
      send("#{k}=", v)
    end
  end

  def self.call(action: '', data: {})
    url = URI("http://localhost:3000/api/v1/designations")
    https = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "a75ba0ff-da81-467b-8f7d-d1515752b142"
    request.body = JSON.dump({
      payload: {
        action: action,
        fields: data,
      }
    })

    response = https.request(request)

    JSON.parse(response.read_body)
  end
end