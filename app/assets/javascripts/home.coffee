# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', -> 
    result = loadData()

    # On successful response
    result.success (res) -> 
        chartData1 = 
            data: res.data.map (condition) -> Number(condition.temp_f)
            labels: 
                title: 'Temperature (F)'
                y: 'Temperature (F)'
                x: 'Days'
        chartData2 = 
            data: res.data.map (condition) -> Number(condition.temp_c)
            labels: 
                title: 'Temperature (C)'
                y: 'Temperature (C)'
                x: 'Days'
        renderChart 'chart-one', chartData1
        renderChart 'chart-two', chartData2

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
            name: 'Temperature'
            data: chartData.data
        ]