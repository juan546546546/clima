# clima
Este es el codigo


en el archivo main.dart inicia, tengo 2 servicios el de la API  y el mio para login con firebase

en la pagina de src/service.dart esta el servicio que conecta con la api y extrae los datos que necesito desde la api
nota: si tiene postman iniciado realice esta peticion:  https://api.waqi.info/feed/@6570/?token=84f345500b6e45baa97fc82af26df243bc24e458 (son los datos de la estacion de 'Aguilas, Jalisco, Mexico')


los datos que extrae del json del link de postman los convierto en src/models/clima_models.dart y los datos para sacar el minimo y el maximo estan en la clase data

class Data {
  Data({
    this.aqi,
    this.idx,
    this.attributions,
    this.city,
    this.dominentpol,
    this.iaqi,
    this.time,
    this.forecast,
    this.debug,
  });
  
una ves realizada la peticion me muestra los datos, esos datos se vacian en src/widgets/estacion.dart
en esta pagina src/widgets/estacion.dart quiero aplicar la formula que le mencione, mostrando en un widget Text(); 
o una Card(); 


el valor final de la formula y ya despues con ese valor determino la calidad del aire segun el color,
pero lo que mas me interesa es estructurar la formula


la pagina de la formula esta en 



https://aqicn.org/faq/2015-03-15/air-quality-nowcast-a-beginners-guide/

https://en.wikipedia.org/wiki/NowCast_(air_quality_index)

https://www.airnow.gov/aqi/aqi-basics/



