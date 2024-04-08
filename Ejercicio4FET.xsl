<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Noticias</title>
        <style>
          /* Estilos para los diferentes colores según la categoría */
          .Deportes { color: yellow; }
          .Economía { color: red; }
          .Cultura { color: green; }
          .Política { color: blue; }
        </style>
      </head>
      <body>
        <xsl:apply-templates select="/rss/channel/item">
          <xsl:sort select="translate(pubDate, 'JanFebMarAprMayJunJulAugSepOctNovDec', '010203040506070809101112')" order="descending"/>
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="item">
    <!-- Crear un div para cada noticia -->
    <xsl:variable name="categoryClass">
      <xsl:choose>
        <xsl:when test="category = 'Deportes'">Deportes</xsl:when>
        <xsl:when test="category = 'Economía'">Economía</xsl:when>
        <xsl:when test="category = 'Cultura'">Cultura</xsl:when>
        <xsl:when test="category = 'Política'">Política</xsl:when>
      </xsl:choose>
    </xsl:variable>
    <div class="{$categoryClass}">
      <h2><xsl:value-of select="title"/></h2>
      <p><xsl:value-of select="description"/></p>
      <p><a href="{link}">Leer más</a></p>
    </div>
  </xsl:template>
</xsl:stylesheet>
