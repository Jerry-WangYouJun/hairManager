<div id="header">
	<div class="logo fLeft"></div>
	<div class="tel fright">
		<c:if test="${  empty  userbean}">
			<p>
				<span class="glyphicon glyphicon-user"
					style="color: white; font-size: 20px;"></span> <a
					href="${basePath}/user/register">register</a> / <a
					href="${basePath}/user/signup">sign in</a>
			</p>
		</c:if>
		<c:if test="${ not empty userbean }">
			<p style="color: white">
				<span class="glyphicon glyphicon-user" style="font-size: 20px;"></span>
				Welcome:&nbsp;${userbean }
			</p>
			<p>
				<span class="glyphicon glyphicon-log-out"
					style="color: white; font-size: 20px;"></span><a
					href="${basePath}/user/loginOut">&nbsp;sign out</a>
			</p>
			<br />
			<p>
				<span class="glyphicon glyphicon-text-background"
					style="color: white; font-size: 20px;"></span> <a href="#"
					onclick="msg()">message board</a>
			</p>

		</c:if>
	</div>
	<div id="top_space">
		<ul>
			<li><a class="current_navigation" href="${basePath}/web/index"
				style=""><img src="${basePath}/jsp/pages/images/121.png">HOME</a></li>
			<li><a class="li_1" href="${basePath}/web/main?type=Human Hair Wigs"
				target="_self">Human Hair Wigs</a>
				<dl class="li_3_content">
					<c:forEach items="${Wigs}" var="wig">
						<dd>
							<a class="li_3_content_a"
								href="${basePath}/web/main?subType=${wig}" target="_self">${wig}</a>
						</dd>
					</c:forEach>
				</dl></li>
				<li><a class="li_1" href="${basePath}/web/main?type=Hair Wefts"
				target="_self">Hair Wefts</a>
				<dl class="li_3_content">
					<c:forEach items="${pieceList}" var="piece">
						<dd>
							<a class="li_3_content_a"
								href="${basePath}/web/main?subType=${piece}" target="_self">${piece}</a>
						</dd>
					</c:forEach>
				</dl></li>
			<li><a class="li_1"
				href="${basePath}/web/main?type=Hair Extensions" target="_self">Hair
					Extensions</a>
				<dl class="li_3_content">
					<c:forEach items="${extensions}" var="extension">
						<dd>
							<a class="li_3_content_a"
								href="${basePath}/web/main?subType=${extension}" target="_self">${extension}</a>
						</dd>
					</c:forEach>
				</dl></li>
			<li><a class="li_1" href="${basePath}/web/main?type=Eyelashs"
				target="_self">Eyelashs</a>
				<dl class="li_3_content">
					<c:forEach items="${Eyelashs}" var="Eyelash">
						<dd>
							<a class="li_3_content_a"
								href="${basePath}/web/main?subType=${Eyelash}" target="_self">${Eyelash}</a>
						</dd>
					</c:forEach>
				</dl></li>
			<li><a class="li_1" href="${basePath}/web/information"
				target="_self">Information</a>
				<dl class="li_3_content">
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/about_us"
							target="_self">About Us</a>
					</dd>
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/Wholesale"
							target="_self">Wholesale</a>
					</dd>
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/order"
							target="_self">Order 101</a>
					</dd>
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/acceptable"
							target="_self">Acceptable Payment </a>
					</dd>
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/shipping"
							target="_self">Shipping&Delivery</a>
					</dd>
					<dd>
						<a class="li_3_content_a" href="${basePath}/web/contact"
							target="_self">Contact Us</a>
					</dd>
				</dl></li>
			<li style="clear: both;"></li>
		</ul>
	</div>
	<div style="clear: both;"></div>
</div>