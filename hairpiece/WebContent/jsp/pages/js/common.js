//回到顶部开始
var scrolltotop={
	setting: {startline:1, scrollto: 0, scrollduration:1000, fadeduration:[500, 100]},
	controlHTML: '<img src="_system/gotop.gif" style="width:19px; height:63px" />',
	controlattrs: {offsetx:100, offsety:120}, 
	anchorkeyword: '#top', 

	state: {isvisible:false, shouldvisible:false},

	scrollup:function(){
		if (!this.cssfixedsupport) 
			this.$control.css({opacity:0}) 
		var dest=isNaN(this.setting.scrollto)? this.setting.scrollto : parseInt(this.setting.scrollto)
		if (typeof dest=="string" && jQuery('#'+dest).length==1) 
			dest=jQuery('#'+dest).offset().top
		else
			dest=0
		this.$body.animate({scrollTop: dest}, this.setting.scrollduration);
	},

	keepfixed:function(){
		var $window=jQuery(window)
		var controlx=$window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx
		var controly=$window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety
		this.$control.css({left:controlx+'px', top:controly+'px'})
	},

	togglecontrol:function(){
		var scrolltop=jQuery(window).scrollTop()
		if (!this.cssfixedsupport)
			this.keepfixed()
		this.state.shouldvisible=(scrolltop>=this.setting.startline)? true : false
		if (this.state.shouldvisible && !this.state.isvisible){
			this.$control.stop().animate({opacity:1}, this.setting.fadeduration[0])
			this.state.isvisible=true
		}
		else if (this.state.shouldvisible==false && this.state.isvisible){
			this.$control.stop().animate({opacity:0}, this.setting.fadeduration[1])
			this.state.isvisible=false
		}
	},
	
	init:function(){
		jQuery(document).ready(function($){
			var mainobj=scrolltotop
			var iebrws=document.all
			mainobj.cssfixedsupport=!iebrws || iebrws && document.compatMode=="CSS1Compat" && window.XMLHttpRequest 
			mainobj.$body=(window.opera)? (document.compatMode=="CSS1Compat"? $('html') : $('body')) : $('html,body')
			mainobj.$control=$('')
				.css({position:mainobj.cssfixedsupport? 'fixed' : 'absolute', bottom:mainobj.controlattrs.offsety, right:mainobj.controlattrs.offsetx, opacity:0, cursor:'pointer'})
				.attr({title:'返回顶部'})
				.click(function(){mainobj.scrollup(); return false})
				.appendTo('body')
			if (document.all && !window.XMLHttpRequest && mainobj.$control.text()!='') 
				mainobj.$control.css({width:mainobj.$control.width()}) 
			mainobj.togglecontrol()
			$('a[href="' + mainobj.anchorkeyword +'"]').click(function(){
				mainobj.scrollup()
				return false
			})
			$(window).bind('scroll resize', function(e){
				mainobj.togglecontrol()
			})
		})
	}
}
scrolltotop.init()
//回到顶部结束

//导航下拉开始
$(function(){
	$(".main_nav").mousemove(function(){
		$(this).find("ul").fadeIn("fast");	
	});
	$(".main_nav").mouseleave(function(){
		$(this).find("ul").fadeOut("fast");
	});
});
//导航下拉结束

//漂浮客服开始
lastScrollY = 0;
function FloatScroll() {
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop){
    	diffY = document.documentElement.scrollTop;
	}
    else if (document.body){
    	diffY = document.body.scrollTop;
	}
    percent = .1 * (diffY - lastScrollY);
    if (percent > 0){
		percent = Math.ceil(percent);
	}
    else{
		percent = Math.floor(percent);
	}
    document.getElementById("online_support_main").style.top = parseInt(document.getElementById("online_support_main").style.top) + percent + "px";
    lastScrollY = lastScrollY + percent;
}
function close_support(){
	document.getElementById("online_support_main").style.visibility = 'hidden';
}
//漂浮客服结束

//产品

$.fn.extend({     
   AdAdvance:function(){
	var listobj=this;
        var objs =$('dt',this);
	var view =objs.length-1;//parseInt( Math.random()*objs.length);
	objs.each(function(i){
	$(this).mouseover(function(){ $('dd',listobj).hide();$('.dropList-hover',listobj).attr("class",""); $(this).children("p").attr("class","dropList-hover");$(this).next().show()})
	if(i!=view)
	{
		$(this).next().hide();
	}
	else
	{
		$(this).next().show();
		$(this).children("p").attr("class","dropList-hover");
	}
	});
    }
}); 
