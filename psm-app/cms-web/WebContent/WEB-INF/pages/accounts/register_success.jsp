<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="h" tagdir="/WEB-INF/tags" %>
<html lang="en-US">
  <c:set var="title" value="Registration Complete"/>
  <h:handlebars template="includes/html_head" context="${pageContext}"/>
  <body>
    <div id="wrapper">
      <div id="header">
        <div class="contentWidth"></div>
        <!-- /.contentWidth -->
      </div>
      <!-- /#header -->

      <div id="mainContent" class="detailPage">
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
          </div>
          <!-- /.mainNav -->
          <div class="head">
            <h1 class="text">Welcome</h1>
          </div>
          <div class="tabSection">
            <div class="detailPanel">
              <div class="section" id="updateProfile">
                <div class="wholeCol">
                  <h3>Welcome
                    <c:out value="${account.username}"/>!</h3>
                  <p>You have successfully registered an account.</p>
                  <p>
                    We have sent a confirmation email to
                    <i><c:out value="${account.email}"/></i> with your login information.
		    If you do not receive the email within a reasonable amount of time, please
                    <a href="#">contact us</a> and we will resend the notification.
                  </p>
                </div>
              </div>
              <!-- /.section -->
              <div class="tl"></div>
              <div class="tr"></div>
              <div class="bl"></div>
              <div class="br"></div>
            </div>
            <div class="buttonBox">
              <a href="<c:url value="/login" />" class="purpleBtn">
                Login
              </a>
            </div>
          </div>
          <!-- /.tabSection -->
        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>
