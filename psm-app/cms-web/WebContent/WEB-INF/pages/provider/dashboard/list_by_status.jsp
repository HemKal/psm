<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="h" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en-US">
  <c:set var="title" value="${listType}"/>
  <h:handlebars template="includes/html_head" context="${pageContext}"/>
  <body>
    <div id="wrapper">
      <h:handlebars template="includes/header" context="${pageContext}"/>
      <!-- /#header -->

      <div id="mainContent">
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
            <c:set var="activeTabEnrollments" value="true"/>
            <h:handlebars template="includes/nav" context="${pageContext}"/>
          </div>
          <!-- /.mainNav -->
          <div class="breadCrumb">
            <%@ include file="/WEB-INF/pages/admin/includes/enrollments_link.jsp" %>
            <span>${listType}</span>
          </div>
          <h1>${listType}</h1>

          <div class="tabSection">
            <c:set var="paginatedResults" value="${results}"/>
            <div class="tabHead">
              <div class="tabR">
                <div class="tabM">
                  <a class="tab allTab ${statusFilter == 'All' ? 'active' : ''}"
                    href="<c:url value="/provider/dashboard/" />">
                    <span class="aR">
                      <span class="aM">All</span>
                    </span>
                  </a>
                  <a class="tab draftTab ${statusFilter eq 'Draft' ? 'active' : ''}"
                    href="<c:url value="/provider/dashboard/drafts" />">
                    <span class="aR">
                      <span class="aM">Draft</span>
                    </span>
                  </a>
                  <a class="tab pendingTab ${statusFilter eq 'Pending' ? 'active' : ''}"
                    href="<c:url value="/provider/dashboard/pending" />">
                    <span class="aR">
                      <span class="aM">Pending</span>
                    </span>
                  </a>
                  <a class="tab approvedTab ${statusFilter eq 'Approved' ? 'active' : ''}"
                    href="<c:url value="/provider/dashboard/approved" />">
                    <span class="aR">
                      <span class="aM">Approved</span>
                    </span>
                  </a>
                  <a class="tab deniedTab ${statusFilter eq 'Rejected' ? 'active' : ''}"
                    href="<c:url value="/provider/dashboard/rejected" />">
                    <span class="aR">
                      <span class="aM">Denied</span>
                    </span>
                  </a>
                  <h:create-enrollment-button cssClass="purpleBtn"/>
                </div>
              </div>
            </div>
            <!-- /.tabHead -->
            <div class="tabContent" id="tabDraft">
              <c:url var="exportResultsURL" value="/provider/dashboard/export"/>

              <div class="pagination">
                <%@ include file="/WEB-INF/pages/includes/pagination_details_wrapper.jsp" %>
                <div class="right">
                  <a href="javascript:;" class="blueBtn filterBtn ${param.filterViewState eq 'visible' ? 'hideFilter' : 'showFilter'}">
                    <span class="text">${param.filterViewState eq 'visible' ? 'Hide Filter' : 'Filter'}</span>
                    <span class="arrow"></span>
                  </a>
                  <c:if test="${statusFilter != 'All'}">
                    <a
                      href="javascript:submitFormById('filterForm','${exportResultsURL}')"
                      class="greyBtn iconPdf"
                    >
                      Export to PDF
                    </a>
                  </c:if>
                </div>
              </div>
              <!-- /.pagination -->

              <c:choose>
                <c:when test="${statusFilter == 'All'}">
                  <%@include file="dashboard_filter.jsp" %>
                </c:when>
                <c:otherwise>
                  <%@include file="list_by_status_filter.jsp" %>
                </c:otherwise>
              </c:choose>

              <div class="tableContainer">
                <%@include file="status_results_table.jsp" %>
              </div>
              <!-- /.tableContainer -->
              <div class="tabFoot">
                <div class="tabR">
                  <div class="tabM">
                    <%@ include file="/WEB-INF/pages/includes/pagination_details_and_links.jsp" %>
                  </div>
                </div>
              </div>
              <!-- /.tabFoot -->
            </div>
            <!-- /#tabDraft -->
          </div>
          <!-- /.tabSection -->
        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
      <!-- #footer -->
      <div class="clear"></div>
    </div>
    <!-- /#wrapper -->
    <!-- /#modalBackground-->
    <div id="modalBackground"></div>
    <div id="new-modal">

      <%@include file="/WEB-INF/pages/provider/enrollment/steps/modal/print_modal.jsp" %>

      <c:set var="userHelpModalId" value="user-help-modal"/>
      <h:handlebars template="includes/userhelp/user_help_modal" context="${pageContext}" />

    </div>
  </body>
</html>
