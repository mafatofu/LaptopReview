<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>


    <script>
	    var width = window.outerWidth;
	    var height = width*0.56;
	    var fontSize = width*0.15;

    	var svg = d3.select("#wordcloud").append("svg")
            .attr("width", width)
            .attr("height", height); 
        d3.csv("resources/text/result_1.LG전자 울트라PC 15U590-GA56K.csv", function (data) {
            showCloud(data)
            setInterval(function(){
                 showCloud(data)
            },2000) 
        });
        //scale.linear: 선형적인 스케일로 표준화를 시킨다. 
        //domain: 데이터의 범위, 입력 크기
        //range: 표시할 범위, 출력 크기 
        //clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.
        wordScale = d3.scale.linear().domain([0, 100]).range([0, fontSize]).clamp(true);
        colorScale = d3.scale.linear().domain([0, 100]).range(["#405275", "#fbc280"]).clamp(true);
        /* colorScale = d3.scale.linear().domain([0, 100]).range(["#fbc280","#405275"]).clamp(true); */
        //var keywords = ["자리야", "트레이서", "한조"]
        var svg = d3.select("svg")
                    .append("g")
                    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")

        function showCloud(data) {
            d3.layout.cloud().size([width, height])
                //클라우드 레이아웃에 데이터 전달
                .words(data)
 //               .rotate(function (d) {
 //               	return d.text.length > 3 ? 0 : 90;
 //               })
                //스케일로 각 단어의 크기를 설정
                .fontSize(function (d) {
                    return wordScale(d.frequency);
                })
                //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
                .on("end", draw)
                .start();

            function draw(words) { 
                var cloud = svg.selectAll("text").data(words)
                //Entering words
                cloud.enter()
                    .append("text")
                    .style("font-family", 'Stylish')
                    .style("fill", function (d) {
						return colorScale(d.frequency);
                    	// return (keywords.indexOf(d.text) > -1 ? "#fbc280" : "#405275");
                    })
                    .style("fill-opacity", .5)
                    .attr("text-anchor", "middle") 
                    .attr('font-size', 1)
                    .text(function (d) {
                        return d.text;
                    }); 
                cloud
                    .transition()
                    .duration(600)
                    .style("font-size", function (d) {
                        return d.size + "px";
                    })
                    .attr("transform", function (d) {
                        return "translate(" + [d.x, d.y] + ")";
                        //rotate(" + d.rotate + ")";
                    })
                    .style("fill-opacity", .9); 
            }
        }
    </script>
</body>
</html>