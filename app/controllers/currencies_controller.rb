class CurrenciesController < ApplicationController

  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_symbols = @symbols_hash.keys

    render ({ :template => "currency_templates/step_one.html.erb"})

  end

  def input_one
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @requested = params.fetch("first_currency")
    @this_currency = @symbols_hash.fetch(@requested)
    @array_of_symbols = @symbols_hash.keys

    render ({ :template => "currency_templates/step_two.html.erb"})

  end

  def input_two
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @requested = params.fetch("first_currency") 
    @second_requested = params.fetch("second_currency")

    @conversion_data = open("https://api.exchangerate.host/convert?from="+@requested+"&to="+@second_requested).read
    @parsed_convert_data = JSON.parse(@conversion_data)
    @rate_hash = @parsed_convert_data.fetch("info")
    @info = @rate_hash.fetch("rate")
    
    

    @array_of_symbols = @symbols_hash.keys

    render ({ :template => "currency_templates/step_three.html.erb"})

  end

    # @this_currency = @symbols_hash.fetch(@requested)
    # @this_second_currency = @symbols_hash.fetch(@second_requested)
    # @convert_data = open("https://api.exchangerate.host/symbols").read
    # @parsed_data = JSON.parse(@raw_data)

end
