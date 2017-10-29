<body>
<script>
    $.getJSON('http://localhost:8080/api/ajaxGetRegisteredUser', function (data) {

        // Create the chart
        Highcharts.stockChart('container', {


            rangeSelector: {
                selected: 1 
            },

            title: {
                text: 'SignUp Count'
            },
            series: [{
                name: 'No Of Registered User',
                data: data,
                type: 'area',
                threshold: null,
                tooltip: {
                    valueDecimals: 2
                },
                fillColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                }
            }]
        });
    });

</script>
<div id="container" style="height: 400px; min-width: 310px"></div>

</body>














%{--
<!DOCTYPE html>
<html>
<head>
    <title>Test Chart</title>



    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>


    <script type="text/javascript">
        $(function () {
            $("#container").highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Fruit Consumption'
                },
                xAxis: {
                    categories: ['Apples', 'Bananas', 'Oranges']
                },
                yAxis: {
                    title: {
                        text: 'Fruit eaten'
                    }
                },
                series: [{
                    name: 'Jane',
                    data: [1, 0, 4]
                }, {
                    name: 'John',
                    data: [5, 7, 3]
                }]
            });
        });
    </script>

</head>

<body>


<div id="container" style="width:500px; height:400px;"></div>

</body>
</html>--}%
