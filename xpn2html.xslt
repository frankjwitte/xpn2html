<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- These variables could come from user claims or configuration or whatever. -->
    <xsl:variable name="role">Advisor</xsl:variable>
    <xsl:variable name="title">Hees</xsl:variable>
    <xsl:variable name="subtitle">and co</xsl:variable>
    <xsl:variable name="email">me@home.org</xsl:variable>

    <xsl:key name="custom_tags" match="//*" use="name()"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>XPN 2 HTML</title>

                <script src="vue-custom-element.js"></script>

                <script>
                    import heesapp "hees-app.vue";
                    register "hees-app" heesapp;
                    <xsl:for-each select="//*[generate-id() = generate-id(key('custom_tags',name())[1])]">
                    import "<xsl:value-of select="name()"/> "<xsl:value-of select="name()"/>.vue";
                    register "<xsl:value-of select="name()"/> "<xsl:value-of select="name()"/>";
                    </xsl:for-each>

                </script>



            </head>

            <body>

                Rendered for role:
                <xsl:value-of select="$role"/>

                <xsl:apply-templates/>

            </body>
        </html>

    </xsl:template>


    <xsl:template match="hees-app">
        <hees-app>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>

            <hees-title>
                <xsl:value-of select="$title"/>
            </hees-title>
            <hees-subtitle>
                <xsl:value-of select="$subtitle"/>
            </hees-subtitle>
            <hees-email>
                <xsl:value-of select="$email"/>
            </hees-email>

            <xsl:apply-templates select="hees-menu"/>

            <xsl:apply-templates select="hees-forms"/>
        </hees-app>

    </xsl:template>

    <xsl:template match="hees-menu">
        <hees-menu>
            <xsl:for-each select="hees-menu-header">
                <hees-menu-header>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:for-each select="hees-menu-item">
                        <xsl:if test="@execution=$role">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </hees-menu-header>
            </xsl:for-each>
        </hees-menu>
    </xsl:template>

    <xsl:template match="hees-forms">
        <hees-forms>
            <xsl:for-each select="hees-form">
                <xsl:if test="@execution=$role">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </hees-forms>
    </xsl:template>

</xsl:stylesheet>
