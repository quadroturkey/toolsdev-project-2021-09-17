# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
#= require chart

$(document).on 'ready page:load', -> 
    currentCondition = loadData()

    # Messing with chart class
    chartOne = new Chart('test type')
    chartTwo = new Chart('test type')

    # On successful response
    currentCondition.success (res) -> 
        chartOne.setTitle 'Temperature F°'
        chartOne.setLabelY 'Temperature F°'
        chartOne.setLabelX 'Days'
        chartOne.setDataLabel 'Temperature F°'
        chartOne.setData res.data.map (condition) -> Number(condition.temp_f)

        chartTwo.setTitle 'Temperature C°'
        chartTwo.setLabelY 'Temperature C°'
        chartTwo.setLabelX 'Days'
        chartTwo.setDataLabel 'Temperature C°'
        chartTwo.setData res.data.map (condition) -> Number(condition.temp_c)

        chartOne.render 'chart-one'
        chartTwo.render 'chart-two'

    # Error response
    currentCondition.error (err) -> 
        console.log err

# Load all conditions from database
loadData = -> $.get '/api/conditions'