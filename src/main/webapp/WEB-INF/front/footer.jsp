<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="footer">
		<div class="footer-dis">
			<div class="footer-main">
				<div class="footer-main-1">
					<table class="f-table">
						<tr>
							<th>业务范围</th>
							<th>服务案例</th>
							<th>客户见证</th>
							<th>信息中心</th>
							<th>关于我们</th>
						</tr>
						<tr>
							<td><a href="#">整体安装</a></td>
							<td><a href="#">整体安装</a></td>
							<td><a href="/cust.jhtml">视频见证</a></td>
							<td><a href="/newsList.jhtml?type=0">最新动态</a></td>
							<td><a href="/contactusInfo.jhtml?type=0">公司介绍</a></td>
						</tr>
						<tr>
							<td><a href="#">家具出售</a></td>
							<td><a href="#">家具出售</a></td>
							<td><a href="/cust.jhtml">合作见证</a></td>
							<td><a href="/newsList.jhtml?type=1">媒体报道</a></td>
							<td><a href="/contactusInfo.jhtml?type=1">企业资质</a></td>
						</tr>
						<tr>
							<td><a href="#">家具安装</a></td>
							<td><a href="#">家具安装</a></td>
							<td><a href="/cust.jhtml">客户感言</a></td>
							<td><a href="/newsList.jhtml?type=2">常见问题</a></td>
							<td><a href="/contactusInfo.jhtml?type=2">我们特色</a></td>
						</tr>
						<tr>
							<td><a href="#">环境保洁</a></td>
							<td><a href="#">环境保洁</a></td>
							<td><a href="#">感谢状</a></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a href="#">绿化服务</a></td>
							<td><a href="#">绿化服务</a></td>
							<td><a href="/serviceProcess.jhtml">服务流程</a></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="footer-main-2">
					<img src="/static/public/images/footer-img.png" />
				</div>
				<div class="footer-main-3">
					<h1 style="font-weight: bold;letter-spacing: 5px;margin-top:0;">
						<a href="/oyeInfo.jhtml" style="font-size: 30px;">恭候您的垂询</a>
					</h1>
					<p>${companyInfo.address }</p>
					<p>T:${companyInfo.phone }</p>
					<!-- <p>+86 21 5032 1196</p> -->
					<p>F:${companyInfo.fax }</p>
					<p>M:${companyInfo.mobile }</p>
				</div>
			</div>
		</div>
		<div class="footer-cn">
			Copyright &copy; 2014-2018 ${companyInfo.name } All Rights Reserved 
		</div>
	</div>
