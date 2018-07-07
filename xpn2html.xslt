<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
            <head>
                <title>XPN 2 HTML</title>

                <script src="vue-custom-element.js"></script>

                <script>
                    import heesapp "hees-app.vue";
                    register "hees-app" heesapp;

                    // ....hier alle custom tags.........

                </script>

            </head>

            <body>

                <xsl:copy-of select="hees-app">
                </xsl:copy-of>

            </body>
        </html>


    </xsl:template>

</xsl:stylesheet>