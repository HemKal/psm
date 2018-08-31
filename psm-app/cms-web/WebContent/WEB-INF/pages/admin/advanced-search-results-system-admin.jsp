<%--
 Copyright (C) 2012 TopCoder Inc., All Rights Reserved.

 @author TCSASSEMBLER
 @version 1.0

 The advanced search results page.
--%>
<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>
<c:set value="false" var="isUpdateUser"></c:set>
<c:set value="false" var="hasArrow"></c:set>

<!DOCTYPE html>
<html lang="en-US">
  <c:set value="Advanced Search (System Admin)" var="title"></c:set>
  <h:handlebars template="includes/html_head" context="${pageContext}" />
  <body>
    <div id="wrapper">
      <h:handlebars template="includes/header" context="${pageContext}" />
      <div id="mainContent" <c:if test='${isUpdateUser}'>class="detailPage"</c:if>>
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
            <h:handlebars template="includes/nav" context="${pageContext}"/>
          </div>

          <div class="breadCrumb">
            <span class="text">Advanced Search</span>
          </div>
          <h1>Advanced Search</h1>
          <div class="systemAdminFrom">
            <form:form cssClass="tabSection" id="advancedSearch" action="${ctx}/system/search/list" modelAttribute="criteria" method="post">
              <div class="detailPanel">
                <div class="section">
                  <div class="leftCol">
                    <div class="row">
                      <label>Username</label>
                      <form:input cssClass="normalInput" path="username"/>
                    </div>
                    <div class="row">
                      <label>Last Name</label>
                      <form:input cssClass="normalInput" path="lastName"/>
                    </div>
                    <div class="row">
                      <label>First Name</label>
                      <form:input cssClass="normalInput" path="firstName"/>
                    </div>
                  </div>
                  <!-- /.leftCol -->
                  <div class="rightCol">
                    <div class="row checkRow">
                      <label>Email</label>
                      <div class="checkWrapper">
                        <form:input cssClass="normalInput" path="email"/>
                      </div>
                    </div>
                    <div class="row checkRow">
                      <label>Role</label>
                      <div class="checkMain">
                        <div class="checkWrapper">
                          <input type="checkbox" name="requestType" class="checkAll" <c:if test="${fn:length(criteria.roles) eq 4}">checked="checked"</c:if> />
                          <span class="minWidth">All</span>
                          <input type="checkbox" name="roles" value="Service Agent" <c:if test="${fn:indexOf(roles, 'Service Agent') ge 0}">checked="checked"</c:if> />
                          <span class="label">Service Agent</span>
                          <input type="checkbox" name="roles" value="System Administrator" <c:if test="${fn:indexOf(roles, 'System Administrator') ge 0}">checked="checked"</c:if> />
                          <span class="label">System Administrator</span>
                          <div class="clearFixed"></div>
                          <input type="checkbox" name="roles" value="Provider" <c:if test="${fn:indexOf(roles, 'Provider') ge 0}">checked="checked"</c:if> />
                          <span class="minWidth">Provider</span>
                          <input type="checkbox" name="roles" value="Service Administrator" <c:if test="${fn:indexOf(roles, 'Service Administrator') ge 0}">checked="checked"</c:if> />
                          <span class="label">Service Administrator</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <input type="hidden" id="and" name="and" value="true" />
                  <form:hidden id="pageSize" path="pageSize" />
                  <form:hidden id="pageNumber" path="pageNumber" />
                  <form:hidden id="sortColumn" path="sortColumn" />
                  <form:hidden id="ascending" path="ascending" />
                  <form:hidden id="showFilterPanel" path="showFilterPanel" />
                  <!-- /.rightCol -->
                  <div class="clearFixed"></div>
                </div>
                <!-- /.section -->
                <div class="tl"></div>
                <div class="tr"></div>
              </div>
              <div class="clearFixed"></div>
              <div class="buttons">
                <button class="purpleBtn" type="submit"><span class="icon">Search</span><span class="arrow"></span></button>
              </div>
          </form:form>
        <!-- /.tabSection -->
        </div>

        <c:set var="hasFilterPanel" value="false" />
        <%@ include file="/WEB-INF/pages/admin/includes/search_results_section_system_admin.jsp" %>

        <!-- /.tabSection -->
      </div>
    </div>
    <!-- /#mainContent -->
    <h:handlebars template="includes/footer" context="${pageContext}"/>
    <!-- #footer -->
    <div class="clear"></div>
    </div>
    <!-- /#wrapper -->
    <%@ include file="/WEB-INF/pages/admin/includes/modal.jsp" %>
    <input type="hidden" value="<c:url value='/admin/user/list' />" id="userAccountsURL" />
    <input type="hidden" value="<c:url value='/system/search/delete' />" id="deleteAccountsURL" />
  </body>
</html>
