# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
   # Template Data
   # =============
   # These are variables that will be accessible via our templates
   # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
   
   # Ignore Custom Patterns
   # Can be set to a regex of custom patterns to ignore from the scanning process
   ignoreCustomPatterns: /.*\.EXCLUDE/ 
  
   collections:
      getDocsInLangES:  ->
         #docpad.log("info", "en col menu, lang=" + @getUtlLang() )
         @getCollection("html").findAll({isPage:true, url: $startsWith:  '/es/' }) 
      getDocsInLangEN:  ->
         @getCollection("html").findAll({isPage:true, url: $startsWith:  '/en/' }) 
      getDocsInLangFR:  ->
         @getCollection("html").findAll({isPage:true, url: $startsWith:  '/fr/' }) 
      
      # url: $startsWith: '/' + @currentLang
      # <% for it in  @getCollection("html").findAll({ url: $startsWith: '/es' + '/' }).toJSON(): %>
      
      pages: ->
         @getCollection("html").findAllLive({isPage:true},[{filename:1}]).on "add", (model) ->
            model.setMetaDefaults({layout:"default"})




   templateData:
      # https://github.com/sergeche/docpad-plugin-menu#plugin-configuration
      menuOptions:
         optimize: false
         #skipFiles:
       
      # -----------------------------
      # Language Definition
    
      currentLang: 'es'

      locale:
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
       
      # Specify some site properties
      site:
         # The production url of our website
         url: "http://www.mdjg.org"
         assets: "/"
         # Scripts
  

         # Here are some old site urls that you would like to redirect from
         oldUrls: [
            'www.website.com',
            'website.herokuapp.com'
         ]
         
         # The default title of our website
         title: "Museo de Dibujo Julio Gavín"
         
         # The website description (for SEO)
         description: """
           Museo de Dibujo "Julio Gavín" - Castillo de Larrés
           """
         
         # The website keywords (for SEO) separated by commas
         keywords: """
            place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
            """
         
         # The website author's name
         author: "fmanaya"
         
         # The website author's email
         email: "fmanaya@gmail.com"
         
         # Your company's name
         copyright: "© Amigos de Serrablo 2013"

      #fin site   
   
      # Helper Functions
      # ----------------
      getScripts: ->
         scripts = [
           @baseurl + "/vendor/foundation/js/foundation.min.js", 
           @baseurl + "/scripts/script.js"
         ]
         return scripts;    

      getStyles: ->
         styles = [
           @baseurl + "/styles/style.css"
         ]
         return styles;    


      getLang: ->
         urlLang = @getUrlLang()
         if  urlLang 
            currentLang = urlLang
         else
            currentLang = @currentLang.toString()
         return @locale[currentLang]
         
      # Get the Absolute URL of a document
      getUrlLang: ->
         #  return @site.url + (document.url or document.get?('url'))      
         match = /../i.exec @document.relativePath
         if match
            return match[0]
         else
            return ''        
   
      getDocsInCurrentLangKK: ->
         urlLang = match = /../i.exec @document.relativePath     
         #docpad.log("info", "en col menu, lang=" + urlLang)
         return @getCollection("documents").findAll({ url: $startsWith:  + '/'+urlLang+'/' }) 
          
         
      # Get the prepared site/document title
      # Often we would like to specify particular formatting to our page's title
      # we can apply that formatting here
      getPreparedTitle: ->
         # if we have a document title, then we should use that and suffix the site's title onto it
         if @document.title
            "#{@document.title} | #{@site.title}"
         # if our document does not have it's own title, then we should just use the site's title
         else
           @site.title
   
      # Get the prepared site/document description
      getPreparedDescription: ->
         # if we have a document description, then we should use that, otherwise use the site's description
         @document.description or @site.description
   
      # Get the prepared site/document keywords
      getPreparedKeywords: ->
         # Merge the document keywords with the site keywords
         @site.keywords.concat(@document.keywords or []).join(', ')


        
   environments:
      development:
         # Always refresh from server
         maxAge: false  # default
         templateData:
            baseurl: ""
            site:
               url: "/"
      ,
      static:
         templateData:
            baseurl: "/xxxxx"
      ,    
      staging:
         templateData:
            baseurl: "/maquetaMDCL"       

}

# Export the DocPad Configuration
module.exports = docpadConfig