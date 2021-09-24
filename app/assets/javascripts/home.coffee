# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', -> 
    currentCondition = loadData()

    # On successful response
    currentCondition.success (res) -> 
        chartData1 = 
            data: res.data.map (condition) -> Number(condition.temp_f)
            labels: 
                title: 'Temperature F°'
                dataName: 'Temperature F°'
                y: 'Temperature F°'
                x: 'Days'
        chartData2 = 
            data: res.data.map (condition) -> Number(condition.temp_c)
            labels: 
                title: 'Temperature C°'
                dataName: 'Temperature C°'
                y: 'Temperature C°'
                x: 'Days'
        renderChart 'chart-one', chartData1
        renderChart 'chart-two', chartData2

    # Error response
    currentCondition.error (err) -> 
        console.log err

# Load all conditions from database
loadData = -> $.get '/api/conditions'

# Render chart from Highcharts
renderChart =(container, chartData) -> 
    Highcharts.chart container,
        title: 
            text: chartData.labels.title
        yAxis:
            title: 
                text: chartData.labels.y
        xAxis: 
            title: 
                text: chartData.labels.x
        plotOptions:
            series:
                pointStart: 30
        series: [
            name: chartData.labels.dataName
            data: chartData.data
        ]