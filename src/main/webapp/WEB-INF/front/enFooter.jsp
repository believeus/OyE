<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.f-table th {
	    color: #e15c6f;
	    font-size: 12px;
	    height: 40px;
	    text-align: left;
	    width: 115px;
	}
	.footer-main-2 {
	    float: left;
	    height: auto;
	    margin-top: 26px;
	    overflow: hidden;
	    width: 385px;
	}
	.footer-main-1 {
	    float: left;
	    height: auto;
	    overflow: hidden;
	    width: 585px;
	}
</style>
<div class="footer">
		<div class="footer-dis">
			<div class="footer-main">
				<div class="footer-main-1">
					<table class="f-table">
						<tr>
							<th>Business</th>
							<th>Service</th>
							<th>Customer</th>
							<th>Information</th>
							<th>AboutUs</th>
						</tr>
						<tr>
							<td><a href="#">Relocation</a></td>
							<td><a href="#">Relocation</a></td>
							<td><a href="/cust.jhtml">Testimony</a></td>
							<td><a href="/newsList.jhtml?type=0">Developments</a></td>
							<td><a href="/contactusInfo.jhtml?type=0">Introduction</a></td>
						</tr>
						<tr>
							<td><a href="#">Warehousing</a></td>
							<td><a href="#">Warehousing</a></td>
							<td><a href="/cust.jhtml">Cooperative</a></td>
							<td><a href="/newsList.jhtml?type=1">MediaReports</a></td>
							<td><a href="/contactusInfo.jhtml?type=1">CompanyTeam</a></td>
						</tr>
						<tr>
							<td><a href="#">Furniture</a></td>
							<td><a href="#">Furniture</a></td>
							<td><a href="/cust.jhtml">Testimonials</a></td>
							<td><a href="/newsList.jhtml?type=2">CommonProblem</a></td>
							<td><a href="/contactusInfo.jhtml?type=2">OursFeature</a></td>
						</tr>
						<tr>
							<td><a href="#">Environmental</a></td>
							<td><a href="#">Environmental</a></td>
							<td><a href="#">ThanksLetter</a></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a href="#">GreenService</a></td>
							<td><a href="#">GreenService</a></td>
							<td><a href="/serviceProcess.jhtml">ServiceProcess</a></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="footer-main-2">
					<img src="/static/public/images/footer-img.png" />
				</div>
				<div class="footer-main-3">
					<h1 style="font-family: 黑体; font-weight: bold; font-size: 20px;">Waiting for your call</h1>
					<p>${companyInfo.address }</p>
					<p>T:${companyInfo.phone }</p>
					<!-- <p>+86 21 5032 1196</p> -->
					<p>F:${companyInfo.fax }</p>
					<p>M:${companyInfo.mobile }</p>
				</div>
			</div>
		</div>
		<div class="footer-cn">
			Copyright &copy; 2014 ${companyInfo.name } All Rights Reserved 沪ICP备11000511号-34
		</div>
	</div>
