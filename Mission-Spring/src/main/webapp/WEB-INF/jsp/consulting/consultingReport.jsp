<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>추가상담</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
</head>

 <body class="bg-light">
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<br>
	<br>
	<br>
	<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <div class="p-5 shadow rounded content">
          <h1>${ consulting.name }님의 상담리포트</h1>
          <p>
          <table>
                 <tbody>
                 <tr>
                  <td align="center">${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td align="center">${ consulting.customerType }</td>
                  <td>${ consulting.id }</td>
                  <td>${ consulting.name }</td>
                  <td>${ consulting.birth }</td>
                  <td>${ consulting.mainCategory }</td>
                  <td>${ consulting.middleCategory }</td>
                  <td>${ consulting.title }</td>
                  <td>${ consulting.consultingReport }</td>
                  <td>${ consulting.adminName }</td>
                  <td>${ consulting.empno }</td>
                  <td align="center">${ consulting.progress }</td>
                  <td align="center">${ consulting.addConsulting }</td>
                 </tr>
                </tbody> 
              </table>
          </p>
          <div class="mt-5">

            <!-- changelog post -->
            <h3 id="february-updates">February Updates</h3>
            <p><strong>Feb 6, 2019</strong></p>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt dolore
              magna aliquyam erat, sed diam voluptua. At vero eos et ustoLorem ipsum dolor sit amet, consetetur.&rdquo;
            </p>
            <div class="mt-4">
              <div class="badge changed">Changed</div>
              <ul>
                <li>
                  <p>Better support for using applying additional filters to posts_tax_query for categories for custom
                    WordPress syncs</p>
                </li>
                <li>
                  <p>Reporting fine-tuning for speed improvements (up to 60% improvement in latency)</p>
                </li>
                <li>
                  <p>Replaced login / registration pre-app screens with a cleaner design</p>
                </li>
              </ul>
            </div>
            <div class="mt-4">
              <div class="badge removed">Removed</div>
              <ul>
                <li>Removed an issue with the sync autolinker only interlinking selectively.</li>
                <li>Removed up an issue with prematurely logging out users</li>
              </ul>
            </div>
            
            <hr>

            <!-- changelog post -->
            <h3 id="march-updates">March Updates</h3>
            <p><strong>Mar 6, 2019</strong></p>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor <br> invidunt
              dolore magna aliquyam erat, sed diam voluptua. At vero eos et ustoLorem ipsum dolor sit amet,
              consetetur.&rdquo;</p>
            <div class="mt-4">
              <div class="badge added">Added</div>
              <ul>
                <li>Some scheduled changelogs, tweets, and slack messages queued up this weekend and were not published
                  on time. We fixed the issue and all delayed publications should be out.</li>
                <li>We now prioritize keywords over title and body so customers can more effectively influence search
                  results</li>
                <li>Support form in the Assistant is now protected with reCaptcha to reduce spam reinitializeOnUrlChange
                  added to the JavaScript API to improve support for pages with turbolinks</li>
              </ul>
            </div>
            <div class="mt-4">
              <div class="badge fixed">Fixed</div>
              <ul>
                <li>Fixed an issue with the sync autolinker only interlinking selectively.</li>
                <li>Fixed up an issue with prematurely logging out users</li>
              </ul>
            </div>
            
            <hr>

            <!-- changelog post -->
            <h3 id="changelog-label">Changelog label</h3>
            <div class="mt-4">
              <div class="badge added">Added</div>
            </div>
            <div class="mt-4">
              <div class="badge changed">Changed</div>
            </div>
            <div class="mt-4">
              <div class="badge depricated">Depricated</div>
            </div>
            <div class="mt-4">
              <div class="badge removed">Removed</div>
            </div>
            <div class="mt-4">
              <div class="badge fixed">Fixed</div>
            </div>
            <div class="mt-4">
              <div class="badge security">Security</div>
            </div>
            <div class="mt-4">
              <div class="badge unreleased">Unreleased</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	<footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>