# Export Plugin
module.exports = (BasePlugin) ->

   # Define Plugin
   class Mdcli18nPlugin extends BasePlugin

      # Plugin name
      name: 'mdcli18n'

      # Plugin config
      # Only on the development environment, should we format the coffeecup output
      config:
         k1: 'k1'

      # Extend Template Data
      extendTemplateData: ({templateData}) ->
         # Prepare
         {docpad,config} = @
      
         # -----------------------------
         # Language Definition

         templateData.currentLang = 'es'
      
         templateData.i18n = {
            en:
               title: 'Julio Gavín Drawing Museum - Castillo de Larrés'
               titleHTML: 'Julio Gavín Drawing Museum <br/> "Castillo de Larrés"'
               slogan: 'The definitive front-end performance guide'
               url: 'http://browserdiet.com/en'
               htmlLang: 'en-US'
               credits: ''
               menu:
                  Home: 'Julio Gavín Drawing Museum'
                  Visita: 'VISIT'
                  Museo: 'MUSEUM'
                  Objetivos: 'GOALS'
                  Historia: 'HISTORY'
                  Coleccion:  'COLLECTION'
                  Biblioteca: 'LIBRARY'
                  Educacion:  'EDUCATION'
                  Comunidad:  'COMMUNITY'
                  Pirineo:    'PYRENEES'
                  Tienda:     'SHOP'
                  Acerca:     'About'
            es:
               title: 'Museo de Dibujo Julio Gavín - Castillo de Larrés'
               titleHTML: 'Museo de Dibujo Julio Gavín - "Castillo de Larrés"'
               slogan: 'La guía definitiva para el rendimiento front-end'
               url: 'http://browserdiet.com'
               htmlLang: 'es-ES'
               credits: ''
               expotempanteriores: 'Exposiciones temporales anteriores ....'
               menu:
                  Home: 'Museo de Dibujo Julio Gavín'
                  Visita: 'VISITAR'
                  Museo: 'MUSEO'
                  Coleccion: 'COLECCIÓN'
                  Biblioteca: 'BIBLIOTECA'
                  Educacion: 'EDUCACIÓN'
                  Comunidad: 'COMUNIDAD'
                  Pirineo: 'PIRINEO'
                  Tienda: 'TIENDA'
                  Acerca:     'ACERCA DE'
                  
            fr:
               title: 'Julio Gavín Dessin Musée - Castillo de Larrés'
               titleHTML: 'Julio Gavín Dessin Musée - "Castillo de Larrés"'
               slogan: 'Le guide ultime des performances côté client'
               url: 'http://browserdiet.com/fr'
               htmlLang: 'fr-FR'
               credits: ''
               menu:
                  Home: 'Julio Gavín Dessin Musée'
                  Visita: 'VISITER'
                  Museo: 'MUSEE'
                  Coleccion:  'COLLECTION'
                  Biblioteca: 'BIBLIOTHÈQUE'
                  Educacion:  'ÉDUCATION'
                  Comunidad:  'COMMUNAUTÉ'
                  Pirineo:    'PYRÉNÉES'
                  Tienda:     'BOUTIQUE'
         }

         #helpers
         templateData.t = (str) ->
            return @getLang().str
            
         templateData.getLang= ->
            urlLang = @getUrlLang()
            if  urlLang
               currentLang = urlLang
            else
               currentLang = @currentLang.toString()
            return @i18n[currentLang]

         # Get the Absolute URL of a document
         templateData.getUrlLang= ->
            #  return @site.url + (document.url or document.get?('url'))
            match = /../i.exec @document.relativePath
            if match
               return match[0]
            else
               return ''
               

         # Chain
         @