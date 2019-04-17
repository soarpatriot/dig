require 'uri'
require 'net/http'
class HomeController < ApplicationController
  def short
    url = 'https://yun.dreamreality.cn/short'
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    render status: response.code, json: response.body 
 
  end
  def normal
    url = 'https://yun.dreamreality.cn/normal'
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    render status: response.code, json: response.body 
 
  end
  def medium
    url = 'https://yun.dreamreality.cn/test'
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    render status: response.code, json: response.body 
  end
  def long
    url = 'https://yun.dreamreality.cn/medium'
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    render status: response.code, json: response.body 
 
  end

end
