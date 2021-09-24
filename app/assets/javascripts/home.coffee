# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', -> 
    result = loadData()
    wTable1 = $ '#weather-table-1'

    # On successful response
    result.success (res) -> 
        appendData wTable1, res
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

# Append all data to table
appendData =(table, res) -> table.append res.data.map (condition) -> "<tr>
                <td>#{condition.id}</td>
                <td>#{condition.date_time}</td>
                <td>#{condition.temp_c}</td>
                <td>#{condition.temp_f}</td>
                <td>#{condition.weather_code}</td>
                <td>#{condition.icon}</td>
                <td>#{condition.desc}</td>
                <td>#{condition.windspeed_mph}</td>
                <td>#{condition.windspeed_kmph}</td>
                <td>#{condition.winddir_degree}</td>
                <td>#{condition.winddir_point}</td>
                <td>#{condition.precip_mm}</td>
                <td>#{condition.precip_in}</td>
                <td>#{condition.humidity}</td>
                <td>#{condition.visibility}</td>
                <td>#{condition.visibility_miles}</td>
                <td>#{condition.pressure}</td>
                <td>#{condition.pressure_in}</td>
                <td>#{condition.cloud_cover}</td>
                <td>#{condition.feels_like_c}</td>
                <td>#{condition.feels_like_f}</td>
                <td>#{condition.uv}</td>
            </tr>"