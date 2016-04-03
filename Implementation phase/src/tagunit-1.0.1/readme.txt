--------------------
| What is TagUnit? |
--------------------
In the same way that JUnit allows us to write unit tests for Java classes, TagUnit allows us to unit test JSP custom tags, inside the container. In essence, TagUnit is a tag library for testing custom tags within JSP pages.


Even with tools like Cactus, JUnitEE and HttpUnit, testing Java Servlets and JSP pages is hard, particularly if they contain specific business or presentation logic that needs to be tested. Best practices around J2EE development suggest that logic should be encapsulated in JavaBeans or JSP custom tags for better separation of concerns, maintainability, reusability and to facilitate easier testing. Although JUnit can be used to test JavaBeans, testing custom tags by simply invoking their methods often isn't enough to provide you with the confidence that they will work. Custom tags are components and should ideally be tested at that level, in the way that they would normally be used from within a JSP page.


TagUnit provides a way to perform assertions on the content that custom tags generate and the side-effects that they have on the environment such as the introduction of scoped (request/page/session/application) attributes, cookies and so on. In addition to this, assertions can be made on the constraints specified within the tag library descriptor file that give us a way to verify the contract that a tag provides. In just a four line JSP page, TagUnit can automatically perform tests such as asserting whether the tag handler class is loadable and that it has setter methods for all declared attributes. To supplement this, user defined tests provide a way to perform assertions on the description of a tag, such as its body content and the details of any attributes.


When testing J2EE applications, a single testing tool often isn't enough. TagUnit compliments other testing toolsby allowing custom tags to be tested as components in their own right, helping to give you confidence that your tags are going to work when deployed and used in production.

----------------
| Requirements |
----------------
TagUnit needs the following software :
 - JDK 1.3 or above (JDK 1.4 needed to use <assertMatch> tag)
 - A JSP 1.2/Servlet 2.3 compatible container such as Tomcat 4.1.x or Resin 2.1.x 

------------------
| Tested against |
------------------
 - Jakarta Tomcat 4.1.27
 - Caucho Resin 2.1.11

There are currently known problems with :
 - Oracle9iAS 9.0.3.0.0 Containers for J2EE (Servlet.getResourcePaths() doesn't work as described by Servlets 2.3)

----------------
| Installation |
----------------
To demonstrate some of these features, the distribution includes some tests for the JSTL and TagUnit tag libraries, wrapped up within the tagunit-examples web application.
 - (1) To run this webapp with Jakarta Tomcat, simply drop the tagunit-examples.war file into the $TOMCAT_HOME/webapps directory of your Tomcat installation.
 - (2) Restart the server and point your browser to http://localhost:8080/tagunit-examples/

-----------------------------------------------------------------------
| Thanks to the following people for their contributions and feedback |
-----------------------------------------------------------------------
 - Sam Dalton, Nag Elluru, Rahul Mahindrakar, Gilberto Matos, Peter Spool, Sean Stephens, Chanoch Wiggers

-----------------------
| Further information |
-----------------------
 - For further details about this release, please see the changes.txt file in the root of this distribution.
 - For license information, please see the license.txt file in the root of this distribution.
 - For further details about TagUnit, please see http://www.tagunit.org.

------------
| Feedback |
------------
Feature requests, comments and feedback are all welcome and can be sent to one of the following:

 - tagunit-devel@lists.sourceforge.net (the development mailing list)
 - tagunit-user@lists.sourceforge.net (the user mailing list)
 - feedback@tagunit.org

Thanks,
Simon