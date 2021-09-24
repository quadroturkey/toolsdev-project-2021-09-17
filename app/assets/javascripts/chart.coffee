class @Chart
    constructor: (type, data = []) ->
        @type = type
        @data = data
    
    getType: -> @type

    getTitle: -> @title
    setTitle: (title) -> @title = title

    getSubtitle: -> @subtitle
    setSubtitle: (subtitle) -> @subtitle = subtitle

    getLabelY: -> @labelY
    setLabelY: (labelY) -> @labelY = labelY

    getLabelX: -> @labelX
    setLabelX: (labelX) -> @labelX = labelX

    getDataLabel: -> @getDataLabel
    setDataLabel: (dataLabel) -> @dataLabel = dataLabel

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
                title: 
                    text: @labelX
            plotOptions:
                series:
                    pointStart: 30
            series: [
                name: @dataLabel
                data: @data
            ]
