[#include "/gato-template/templates/includes/head.ftl"]

<!DOCTYPE HTML>
<html>
<head>
  [@templatejs scripts=['gato-template-library/js/searchbox.js', 'gato-template-library/js/texas-slideshow.js']/]
  <link rel="stylesheet" type="text/css" href="${gf.resourcePath()}/gato-template-library/css/library.compiled.css"/>
  <link href="http://fonts.googleapis.com/css?family=Ubuntu+Condensed" rel="stylesheet" type="text/css" />
  [@templatehead /]
</head>
<body id="library-2012" class="${cmsfn.isEditMode()?string('admin', '')}">
    <!-- either the banners or the header will go here.  menus too... -->
    <div class="txst-khan-frame">
        <h1 class="visuallyhidden" id="maincontent" tabindex="-1">${content.title}</h1>
        <div class="slideshow-bg">
            [@cms.area name="slideshow"/]
            <div class="library-hours">
                [#if cmsfn.isEditMode() || (content.emergency.hours.content)?has_content]
                    <h3 class="hours_emergency">
                        <!-- HOW TO DO EDIT BUTTON HERE? no more cmsUtilTaglib-->
                        [#if (content.emergency.hours)?has_content]
                            ${cmsfn.decode(content.emergency.hours).content}
                        [/#if]
                    </h3>
                [/#if]
                <h3>Library Hours Today</h3>
                ${model.getEvents(false)}
                <div class="hours">
                    <h5>All Hours</h5>
                    <div class="all-hours">
                        [@cms.area name="library-allhours" /]
                    </div>
                </div>
                <div class="hours-links">
                    [@cms.area name="library-hourslinks" /]
                </div>
            </div>
        </div>
        [#if cmsfn.isEditMode() || (content.emergency.general.content)?has_content]
            <h3 class="general_emergency">
                <!-- HOW TO DO EDIT BUTTON HERE? no more cmsUtilTaglib-->
                [#if (content.emergency.hours)?has_content]
                    ${cmsfn.decode(content.emergency.general).content}
                [/#if]
            </h3>
        [/#if]

        [#import "/gato-template-library/templates/includes/searchbox.ftl" as searchbox]
        [@searchbox.searchBox isMobile=false/]
        <div class="quick-links">
            <div class="left">
                <div class="header">
                    Quick Links
                </div>
                [@cms.area name="library-quicklinks" /]
            </div>
            <div class="right">
                <div class="header">
                    Services For
                </div>
                [@cms.area name="library-services" /]
            </div>
        </div>
        <div class="social">
            [@cms.area name="socialmedia" /]
            <div class="button">
                [@cms.area name="support-button" /]
            </div>
        </div>
        <div class="content-boxes">
            <div class="content-box left">
                <h3 class="button">News</h3>
                [@cms.area name="contentboxleft" /]
            </div>
            <div class="content-box middle">
                <h3 class="button">Events</h3>
                [@cms.area name="contentboxmiddle" /]
            </div>
            <div class="content-box right">
                <h3 class="button">Your Library</h3>
                [@cms.area name="contentboxright" /]
            </div>
        </div>
        <div class="library-footer">
            [@cms.area name="library-footer"/]
        </div>
        <div class="more-footer">
            [@cms.area name="footer" content=gf.getOrCreateArea(homepage, 'footer') contextAttributes={"forceFooter": true} editable=false /]
        </div>
    </div>
    [@cssjsmodals /]
</body>
</html>