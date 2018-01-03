//<![CDATA[
$(function(){
	(function(){
		var autoHeight = function()
		{
			var h_win = $(window).height();
			var h_top = $("#top_wrap").outerHeight(true);
			var h_foot = $("#bottom_wrap").outerHeight(true);
			var h_middle = h_win-h_top-h_foot;
			$(".autoHeight").css('min-height', h_middle + 'px');

		};
		autoHeight();

		//首页导航
        $(function(){
            $("#top_space>ul>li").hover(function(){
                $(this).children().next().children().stop().css("display","block").parents().css("z-index","999");
            },function(){
                $(this).children().next().children().stop().css("display","none").parents().css("z-index","0");
            });
        })

		//左侧导航
        $(".content_body_main_l>ul>li").click(function() {
            $(this).addClass("on").siblings().removeClass("on").removeClass("hov");
        })
        $(".content_body_main_l>ul>li").hover(function () {
			if(!$(this).hasClass("on")){
				$(this).addClass("hov");
			}
        },function () {
            if(!$(this).hasClass("on")){
                $(this).removeClass("hov");
            }
        });



		var curr = 0;
		$("#jsNav .trigger").each(function(i){
			$(this).click(function(){
				curr = i;
				$("#js img").eq(i).fadeIn("slow").siblings("img").hide();
				$(this).siblings(".trigger").removeClass("imgSelected").end().addClass("imgSelected");
				return false;
			});
		});
		
		var pg = function(flag){
			if (flag) {
				if (curr == 0) {
					todo = 4;
				} else {
					todo = (curr - 1) % 5;
				}
			} else {
				todo = (curr + 1) % 5;
			}
			$("#jsNav .trigger").eq(todo).click();
		};
		
		//ǰ
		$("#prev").click(function(){
			pg(true);
			return false;
		});
		
		//
		$("#next").click(function(){
			pg(false);
			return false;
		});
		
		//Զ
		var timer = setInterval(function(){
			todo = (curr + 1) % 5;
			$("#jsNav .trigger").eq(todo).click();
		},5000);
		
		$("#js,#prev,#next").hover(function(){
				clearInterval(timer);
			},
			function(){
				timer = setInterval(function(){
					todo = (curr + 1) % 5;
					$("#jsNav .trigger").eq(todo).click();
				},5000);			
			}
		);
	})();
});
//]]>

// 酷站代码整理 http://www.5icool.org/

