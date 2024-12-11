


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>MeteorologiaJSP</title>
    	   <script src="https://maps.googleapis.com/maps/api/js?key=${googleAPI }&callback=initMap"
    async defer></script>
    

    
</head>
<body onload="initMap()">
<br>
<h3 style="text-align: left;">MeteorologiaJSP</h3>
<form action="getData" method="post" style="text-align: left;">
    <label for="zip">Insira um CEP (dos EUA):</label>
    <input type="text" name="zip" id="zip" style="margin-left: 10px;">
    <input type="submit" value="Enviar" style="margin-left: 10px;">
</form><br>
       <div class="container">
           <div class="map">
               <div id='map-canvas'></div>
               <form id="layers">
                   <label class="radio-inline">
                       <input type="radio" name="layer" value="temperature" onclick="initMap();" hidden checked>
                   </label>
               </form>
           </div>

			<script>
    	   var map;
    	   var latitude = ${latitude};
    	   var longitude = ${longitude};
    	   var layer;
		   var spectrum = "SpectrumPics/precipSpectrum.png";

    	   //Taken and modified from Google Maps Platform https://developers.google.com/maps/documentation/javascript/examples/maptype-image-overlay
    	      function initMap() {

    	    	layer = getLayer();
    	        map = new google.maps.Map(document.getElementById('map-canvas'), {
    	          center: {lat: latitude, lng: longitude}, //insert latitude and longitude
    	          zoom: 7
    	        });
    	        var imageMapType = new google.maps.ImageMapType({
    	    	    getTileUrl: function(coord, zoom) {
    	    	      if (zoom > 12) {
    	    	        return null;
    	    	      }

    	    	      return 'https:/api.climacell.co/v3/weather/layers/' + layer + '/now/'+ zoom + '/' + coord.x + '/' + coord.y + '.png?apikey=${CCapiKey}';
    	    	      //Testing between climaCell and openWeatherMap layers
    	    	      //return 'https://tile.openweathermap.org/map/'+ layer + '/' + zoom + '/' + coord.x + '/' + coord.y + '.png?appid=${apiKey}';
    	    	    },
    	    	    tileSize: new google.maps.Size(256, 256),
    	    	    maxZoom: 12,
    	    	    minZoom: 0,
    	    	  });

    	    	  map.overlayMapTypes.push(imageMapType);

    	    	  switch (layer) {
					case "precipitation":
						spectrum = "SpectrumPics/precipSpectrum.png";
						break;
					case "cloud-cover":
						spectrum = "SpectrumPics/cloudSpectrum.png";
						break;
					case "temperature":
						spectrum = "SpectrumPics/tempSpectrum.png";
						break;
					}
    	    	  document.getElementById("spectrum").src = spectrum;
				}


    	      function getLayer() {
      	    	  return document.querySelector('input[name="layer"]:checked').value;
      	        }


    	   </script>



    <div class="weather-table">
        <h3>Dados meteorológicos para ${name}, ${region}</h3>
        <table id="weather_data">
            <tr>
                <td>Latitude</td>
                <td>
                    <script>
                        if (latitude > 0) {
                            document.write(latitude + '\xB0' + 'N');
                        } else {
                            document.write(-latitude + '\xB0' + 'S');
                        }
                    </script>
                </td>
            </tr>
            <tr>
                <td>Longitude</td>
                <td>
                    <script>
                        if (longitude > 0) {
                            document.write(longitude + '\xB0' + 'E');
                        } else {
                            document.write(-longitude + '\xB0' + 'W');
                        }
                    </script>
                </td>
            </tr>
            <tr>
                <td>Nascer do sol</td>
                <td>${sunrise}</td>
            </tr>
            <tr>
                <td>Pôr do sol</td>
                <td>${sunset}</td>
            </tr>
            <tr>
                <td>Clima atual</td>
                <td>${weather}</td>
            </tr>
            <tr>
                <td>Temperatura atual</td>
                <td>${current_temp}&deg</td>
            </tr>
            <tr>
                <td>Sensação térmica</td>
                <td>${feels_like}&deg</td>
            </tr>
            <tr>
                <td>Máxima</td>
                <td>${high}&deg</td>
            </tr>
            <tr>
                <td>Mínima</td>
                <td>${low}&deg</td>
            </tr>
            <tr>
                <td>Umidade</td>
                <td>${humidity}&#37</td>
            </tr>
            <tr>
                <td>Pressão</td>
                <td>${pressure} inHg</td>
            </tr>
            <tr>
                <td>Visibilidade</td>
                <td>${visibility} mi</td>
            </tr>
            <tr>
                <td>Índice UV</td>
                <td>${uv}</td>
            </tr>
            <tr>
                <td>Velocidade do vento</td>
                <td>${degrees} a ${wind_speed} mph</td>
            </tr>
        </table>
    </div>
</div>


 <table id="forecast" style="width:90%">
 	<colgroup>
       <col span="1" style="width: 10%;">
       <col span="1" style="width: 10%;">
       <col span="1" style="width: 70%;">
    </colgroup>
    <tbody>
            	<tr>
            		<td colspan="2"><h2>7-Day Forecast</h2></td>
            	</tr>
            	<tr>
            		<td>${d0 }</td>
            		<td><img src ="${i0 }"></td>
            		<td>${f0 }</td>
            	</tr>
            	<tr>
            		<td>${d1 }</td>
            		<td><img src="${i1 }"></td>
            		<td>${f1 }</td>
            	</tr>
            	<tr>
            		<td>${d2 }</td>
            		<td><img src="${i2 }"></td>
            		<td>${f2 }</td>
            	</tr>
            	<tr>
            		<td>${d3 }</td>
            		<td><img src="${i3 }"></td>
            		<td>${f3 }</td>
            	</tr>
            	<tr>
            		<td>${d4 }</td>
            		<td><img src="${i4 }"></td>
            		<td>${f4 }</td>
            	</tr>
            	<tr>
            		<td>${d5 }</td>
            		<td><img src="${i5 }"></td>
            		<td>${f5 }</td>
            	</tr>
            	<tr>
            		<td>${d6 }</td>
            		<td><img src="${i6 }"></td>
            		<td>${f6 }</td>
            	</tr>
            	<tr>
            		<td>${d7 }</td>
            		<td><img src="${i7 }"></td>
            		<td>${f7 }</td>
            	</tr>
            	<tr>
            		<td>${d8 }</td>
            		<td><img src="${i8 }"></td>
            		<td>${f8 }</td>
            	</tr>
            	<tr>
            		<td>${d9 }</td>
            		<td><img src="${i9 }"></td>
            		<td>${f9 }</td>
            	</tr>
            	<tr>
            		<td>${d10 }</td>
            		<td><img src="${i10 }"></td>
            		<td>${f10 }</td>
            	</tr>
            	<tr>
            		<td>${d11 }</td>
            		<td><img src="${i11 }"></td>
            		<td>${f11 }</td>
            	</tr>
            	<tr>
            		<td>${d12 }</td>
            		<td><img src="${i12 }"></td>
            		<td>${f12 }</td>
            	</tr>
            	<tr>
            		<td>${d13 }</td>
            		<td><img src="${i13 }"></td>
            		<td>${f13 }</td>
            	</tr>
            	</tbody>
            	
            </table>

</body>
