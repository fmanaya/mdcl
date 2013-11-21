# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	# Template Data
  # =============
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:
       
    # Specify some site properties
    site:
      # The production url of our website
      url: "http://www.serrablo.org"
      
      

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

    environments:
      development:
        templateData:
          baseurl: "kk"
      ,
      static:
        templateData:
          baseurl: "/maquetaMDCL"


    # Helper Functions
    # ----------------

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

    getBaseUrl: ->
      if  "serrablo" is @getEnvironment() 
        "/maquetaMDCL/"
      else
        "/"

}

# Export the DocPad Configuration
module.exports = docpadConfig