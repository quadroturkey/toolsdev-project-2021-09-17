# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
#= require chart

$(document).on 'ready page:load', -> 
    currentCondition = loadData()

    # Set up charts
    chartOne = new Chart()
    chartOne.setTitle 'Current Week + Forecast'
    chartOne.setLabelY 'Temperature F°'
    chartOne.setLabelX 'Days'
    chartOne.setDataLabel 'Temperature F°'
    chartOne.setInterval 10800000

    chartTwo = new Chart()
    chartTwo.setTitle '3-Hour Highs and Lows'
    chartTwo.setLabelY 'Temperature F°'
    chartTwo.setLabelX 'Days'
    chartTwo.setDataLabel 'Temperature F°'
    chartTwo.setInterval 10800000

    # On successful response
    currentCondition.success (res) -> 
        conditionRange = filterByDateRange(res.data, '2021-09-24', '2021-09-19')

        chartOne.setStartDate conditionRange[0].date_time.substring(0, 10)
        chartTwo.setStartDate res.data[0].date_time.substring(0, 10)

        chartOne.setData conditionRange.map (condition) -> Number(condition.temp_f)
        chartTwo.setData res.data.map (condition, index) -> Number(condition.temp_f)

        chartOne.render 'chart-one'
        chartTwo.render 'chart-two'

    # Error response
    currentCondition.error (err) -> 
        console.log err

# Load all conditions from database
loadData = -> $.get '/api/conditions'

filterByDateRange = (conditions, endDate, startDate) -> 
    endUnix = new Date(endDate).getTime()
    startUnix = new Date(startDate).getTime()

    return conditions.filter (condition) ->
        conditionUnix = new Date(condition.date_time.substring(0, 10)).getTime()

        if (conditionUnix <= endUnix && conditionUnix > startUnix)
            return condition