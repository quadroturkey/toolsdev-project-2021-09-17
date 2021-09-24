class @Chart
    constructor: (data = []) ->
        @data = data

    getTitle: -> @title
    setTitle: (title) -> @title = title

    getSubtitle: -> @subtitle
    setSubtitle: (subtitle) -> @subtitle = subtitle

    getLabelY: -> @labelY
    setLabelY: (labelY) -> @labelY = labelY

    getLabelX: -> @labelX
    setLabelX: (labelX) -> @labelX = labelX

    getDataLabel: -> @dataLabel
    setDataLabel: (dataLabel) -> @dataLabel = dataLabel

    getStartDate: -> @startDate
    setStartDate: (startDate) -> @startDate = startDate

    getInterval: -> @interval
    setInterval: (interval) -> @interval = interval

    getData: -> @data
    setData: (data) -> @data = data

    render: (container) ->  
        Highcharts.chart container,
            title: 
                text: @title
            subtitle: 
                text: @subtitle
            yAxis:
                title: 
                    text: @labelY
            xAxis: 
                type: 'datetime'
                title: 
                    text: @labelX
                labels: 
                    formatter: ->  Highcharts.dateFormat('%b/%e', this.value)
            plotOptions:
                series:
                    pointStart: 30
            series: [{
                name: @dataLabel
                data: @data
                pointStart: new Date(@startDate).getTime()
                pointInterval: @interval 
            }]
