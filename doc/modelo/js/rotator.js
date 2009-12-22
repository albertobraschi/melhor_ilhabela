
function send_request(){
	this.request.send(this.params);
}
function httpGet( page, ready_state_change ){
	this.request = false;
	/*@cc_on @*/
	/*@if (@_jscript_version >= 5)
	// JScript gives us Conditional compilation, we can cope with old IE versions.
	// and security blocked creation of the objects.
	 try {
	  this.request = new ActiveXObject("Msxml2.XMLHTTP");
	 } catch (e) {
	  try {
	   this.request = new ActiveXObject("Microsoft.XMLHTTP");
	  } catch (E) {
	   this.request = false;
	  }
	 }
	@end @*/
	if (!this.request && typeof XMLHttpRequest!='undefined') {
		try {
			this.request = new XMLHttpRequest();
		} catch (e) {
			this.request=false;
		}
	}
	if (!this.request && window.createRequest) {
		try {
			this.request = window.createRequest();
		} catch (e) {
			this.request=false;
		}
	}
	this.request.open("GET", page ,true);
	this.request.onreadystatechange = ready_state_change;
	this.params = null;
	this.send = send_request;
}


function generate_navigation(){
  var inner_html = "<ul>";
  for ( i = 0; i < r.num_slides; i++ ){
    if ( r.slide_num == i ){
      var j = i+1;
      inner_html += "<li class=\"selected\" >"+j+"</li>";
    } else {
      var j = i+1;
      inner_html += "<li onclick=\"javascript:rotator_browse("+i+")\" >"+j+"</li>";
    }
  }
  inner_html += (r.animating == false ) ? "<li onclick=\"javascript:rotator_play()\"><img src=\""+r.play_image+"\"/></li>" : "<li onclick=\"javascript:rotator_pause()\"><img src=\""+r.pause_image+"\"/></li>";
  inner_html += "</ul>";

  document.getElementById(r.div + "_navigation").innerHTML = inner_html;
}

function animate(){
  if ( ( r.animating == true ) ){
    if ( typeof(r.keyframe[r.tick]) != "undefined" ){

      var frm = r.keyframe[r.tick];

      //change animation
      if ( typeof (frm.top ) != "undefined" ){
        r.top = frm.top;
      }
      if ( typeof (frm.left) != "undefined" ){
        r.left = frm.left;
      }
      if ( typeof( frm.vtop ) != "undefined" ){
        r.vtop = frm.vtop;
      }
      if ( typeof( frm.vleft ) != "undefined" ){
        r.vleft = frm.vleft;
      }
      if ( typeof( frm.opacity) != "undefined" ){
        r.opacity = frm.opacity;
      }
      if ( typeof( frm.vopacity) != "undefined" ){
        r.vopacity = frm.vopacity;
      }
      if ( typeof( frm.text_left ) != "undefined" ){
        r.text_left = frm.text_left;
      }
      if ( typeof( frm.vtext_left ) != "undefined" ){
        r.vtext_left = frm.vtext_left;
      }
      if ( typeof( frm.text_top ) != "undefined" ){
        r.text_top  = frm.text_top;
      }
      if ( typeof( frm.vtext_top ) != "undefined" ){
        r.vtext_top = frm.vtext_top;
      }
    }

    r.top += r.vtop;
    r.left += r.vleft;
    r.opacity += r.vopacity;
    r.text_left += r.vtext_left;
    r.text_top += r.vtext_top;

    var div = document.getElementById( r.div + "_fg" );
    div.style.left = r.left + "px";
    div.style.top = r.top + "px";
    div.style.opacity = r.opacity / 100;
    div.style.filter = "alpha(opacity=" + r.opacity + ")";

    var div_textbox = document.getElementById( r.div + "_textbox" );
    var div_text = document.getElementById( r.div + "_text" );
    div_textbox.style.left = r.text_left + "px";
    div_text.style.left = r.text_left + "px";
    div_textbox.style.top = r.text_top + "px";
    div_text.style.top = r.text_top + "px";
    div_text.style.display = "block";
    div_textbox.style.display = "block";

    r.tick++;
    if ( r.tick <= r.animation_ticks ){
      setTimeout(animate, 1000 / r.animation_resolution);
    } else {
      load_next_slide();
    }

  }
}

var load_slide_request = false;

function do_link( dest, target ){
  switch ( target ){
    case "window":
      window.open(dest);
    break;
    default:
      window.location = dest;
    break;
  }
}
function load_slide_request_ready_state_change(){
  if ( load_slide_request != false ){
    switch ( load_slide_request.request.readyState ){
      case 4:

        var slide = r.slide[r.slide_num];
        var div = document.getElementById( r.div + "_fg" );
        switch ( slide.type ){
          case "html":
            div.innerHTML = load_slide_request.request.responseText;
            document.getElementById( r.div ).style.cursor = "";
          break;
          case "image":
            div.innerHTML = "<div onclick=\"do_link('"+slide.link_to+"','"+slide.target+"')\"><div style=\"background-image:url("+slide.src+");width:"+slide.width+";height:"+slide.height+";overflow:hidden;\"></div></div>";
            document.getElementById( r.div ).style.cursor = "pointer";
          break;

          case "flash":
            var t = "";
            t += "<object width=\""+parseInt(slide.width)+"\" height=\""+parseInt(slide.height)+"\">";
            t += "<param name=\"movie\" value=\""+slide.src+"\">";
            t += "<embed src=\"somefilename.swf\" width=\""+parseInt(slide.width)+"\" height=\""+parseInt(slide.height)+"\">";
            t += "</embed>";
            t += "</object>";
            div.innerHTML = t;
            document.getElementById( r.div ).style.cursor = "";
          break;
        }
        generate_navigation();

        r.tick = 0;
        animate();
        load_slide_request = false;
      break;
    }
  }
}

function load_next_slide(){

  r.slide_num++;
  if ( r.slide_num >= r.num_slides ){
    r.slide_num -= r.num_slides;
  }

  //copy the current slide to the background, including styles
  var div_bg = document.getElementById( r.div + "_bg" );
  var div_fg = document.getElementById( r.div + "_fg" );
  var slide = r.slide[r.slide_num];
  var slide_bottom = parseInt(slide.height) - parseInt(r.height);
  var slide_right = parseInt(slide.width) - parseInt(r.width);

  var transition_ticks = Math.round( slide.transition_speed * r.animation_resolution )
  var exposure_ticks = Math.round( slide.exposure_length * r.animation_resolution );
  var animation_ticks = Math.round( slide.pause_speed * r.animation_resolution );
  var pause_ticks = Math.round( slide.animation_speed * r.animation_resolution );


  r.animation_ticks = exposure_ticks + transition_ticks;

  div_bg.innerHTML = div_fg.innerHTML;
  div_bg.style.top = div_fg.style.top;
  div_bg.style.left = div_fg.style.left;
  div_bg.style.width = div_fg.style.width;
  div_bg.style.height = div_fg.style.height;
  div_bg.style.display = "block";
  div_fg.style.display = "none";
  div_fg.innerHTML = "";

  //compile the animations keyframes
  r.keyframe = new Array();
  switch ( slide.transition ){
    case "fade":
      r.keyframe[0] = new Object();
      r.keyframe[0].vtop = 0;
      r.keyframe[0].vleft = 0;
      r.keyframe[0].left = 0;
      r.keyframe[0].top = 0;
      r.keyframe[0].opacity = 0;
      r.keyframe[0].vopacity = 100 / transition_ticks;
    break;
    case "slide_from_left":
      r.keyframe[0] = new Object();
      r.keyframe[0].vtop = 0;
      r.keyframe[0].vleft = parseInt(slide.width) / transition_ticks;
      r.keyframe[0].left = -parseInt(slide.width);
      r.keyframe[0].top = 0;
      r.keyframe[0].opacity = 100;
      r.keyframe[0].vopacity = 0;
    break;
    case "slide_from_right":
      r.keyframe[0] = new Object();
      r.keyframe[0].vtop = 0;
      r.keyframe[0].vleft = -parseInt(r.width) / transition_ticks;
      r.keyframe[0].left = parseInt(r.width);
      r.keyframe[0].top = 0;
      r.keyframe[0].opacity = 100;
      r.keyframe[0].vopacity = 0;
    break;
    case "slide_from_top":
      r.keyframe[0] = new Object();
      r.keyframe[0].vtop = parseInt(slide.height) / transition_ticks;
      r.keyframe[0].vleft = 0;
      r.keyframe[0].left = 0;
      r.keyframe[0].top = -parseInt(slide.height);
      r.keyframe[0].opacity = 100;
      r.keyframe[0].vopacity = 0;
    break;
    case "slide_from_bottom":
      r.keyframe[0] = new Object();
      r.keyframe[0].vtop = -parseInt(r.height) / transition_ticks;
      r.keyframe[0].vleft = 0;
      r.keyframe[0].left = 0;
      r.keyframe[0].top = parseInt(r.height);
      r.keyframe[0].opacity = 100;
      r.keyframe[0].vopacity = 0;
    break;
  }

  //sliding text comes in
  switch ( slide.text_animation ){
    case "slide_from_right":
      r.keyframe[0].text_top = 0;
      r.keyframe[0].vtext_top = 0;
      r.keyframe[0].text_left = parseInt(r.width);
      r.keyframe[0].vtext_left = -parseInt(r.width) / transition_ticks;
    break;
    case "slide_from_top":
      r.keyframe[0].text_left = 0;
      r.keyframe[0].vtext_left = 0;
      r.keyframe[0].text_top = -parseInt(r.height);
      r.keyframe[0].vtext_top = parseInt(r.height) / transition_ticks;
    break;
    case "slide_from_left":
      r.keyframe[0].text_top = 0;
      r.keyframe[0].vtext_top = 0;
      r.keyframe[0].text_left = -parseInt(r.width);
      r.keyframe[0].vtext_left = parseInt(r.width) / transition_ticks;
    break;
    default:
      r.keyframe[0].text_left = 0;
      r.keyframe[0].vtext_left = 0;
      r.keyframe[0].text_left = 0;
      r.keyframe[0].vtext_left = 0;
    break;
  }

  var i =transition_ticks;
  r.keyframe[i] = new Object();
  r.keyframe[i].text_left = 0;
  r.keyframe[i].vtext_left = 0;
  r.keyframe[i].text_top = 0;
  r.keyframe[i].vtext_top = 0;

  switch ( slide.animation ){
    case "slide_down_and_up":
      var mode = 0;
      while ( i <= exposure_ticks + transition_ticks){
          if ( typeof( r.keyframe[i] ) == "undefined" ){
            r.keyframe[i] = new Object();
          }
          r.keyframe[i].opacity = 100;
          r.keyframe[i].vopacity = 0;

        switch ( mode ){
          case 0:       //move down
            r.keyframe[i].vtop = -slide_bottom / animation_ticks;
            r.keyframe[i].vleft = 0;
            r.keyframe[i].left = 0;
            r.keyframe[i].top = 0;
            i += animation_ticks;
            mode++;
          break;
          case 1:       //pause
            r.keyframe[i].vtop = 0;
            r.keyframe[i].vleft = 0;
            r.keyframe[i].left = 0;
            r.keyframe[i].top = -slide_bottom;
            i += pause_ticks;
            mode++;
          break;
          case 2:       //move up
            r.keyframe[i].vtop = slide_bottom / animation_ticks;
            r.keyframe[i].vleft = 0;
            r.keyframe[i].left = 0;
            r.keyframe[i].top = -slide_bottom;
            i += animation_ticks;
            mode++;
          break;
          case 3:       //pause
            r.keyframe[i].vtop = 0;
            r.keyframe[i].vleft = 0;
            r.keyframe[i].left = 0;
            r.keyframe[i].top = 0;
            i += pause_ticks;
            mode = 0;
          break;
        }

      }
    break;


    case "slide_right_and_left":
      var mode = 0;
      while ( i <= exposure_ticks + transition_ticks){
          if ( typeof( r.keyframe[i] ) == "undefined" ){
            r.keyframe[i] = new Object();
          }
          r.keyframe[i].opacity = 100;
          r.keyframe[i].vopacity = 0;

        switch ( mode ){
          case 0:       //move down
            r.keyframe[i].vleft = -slide_right / animation_ticks;
            r.keyframe[i].vtop = 0;
            r.keyframe[i].top = 0;
            r.keyframe[i].left = 0;
            i += animation_ticks;
            mode++;
          break;
          case 1:       //pause
            r.keyframe[i].vleft = 0;
            r.keyframe[i].vtop = 0;
            r.keyframe[i].top = 0;
            r.keyframe[i].left = -slide_right;
            i += pause_ticks;
            mode++;
          break;
          case 2:       //move up
            r.keyframe[i].vleft = slide_right / animation_ticks;
            r.keyframe[i].vtop = 0;
            r.keyframe[i].top = 0;
            r.keyframe[i].left = -slide_right;
            i += animation_ticks;
            mode++;
          break;
          case 3:       //pause
            r.keyframe[i].vleft = 0;
            r.keyframe[i].vtop = 0;
            r.keyframe[i].top = 0;
            r.keyframe[i].left = 0;
            i += pause_ticks;
            mode = 0;
          break;
        }

      }
    break;
    default:
          var i = transition_ticks;
          if ( typeof( r.keyframe[i] ) == "undefined" ){
            r.keyframe[i] = new Object();
          }
          r.keyframe[i].opacity = 100;
          r.keyframe[i].vopacity = 0;
          r.keyframe[i].vtop = 0;
          r.keyframe[i].vleft = 0;
          r.keyframe[i].left = 0;
          r.keyframe[i].top = 0;
    break;
  }

  //sliding text leaves the screen
  var x = exposure_ticks - transition_ticks;
  if (typeof( r.keyframe[x] ) == "undefined" ){
    r.keyframe[x] = new Object();
  }
  r.keyframe[x].text_left = 0;
  r.keyframe[x].text_top = 0;

  switch ( slide.text_animation ){
    case "slide_from_right":
      r.keyframe[x].vtext_left = parseInt(r.width) / transition_ticks;
    break;
    case "slide_from_top":
      r.keyframe[x].vtext_top = -parseInt(r.height) / transition_ticks;
    break;
    case "slide_from_left":
      r.keyframe[x].vtext_left = -parseInt(r.width) / transition_ticks;
    break;
    default:
      r.keyframe[x].vtext_left = parseInt(r.width) / transition_ticks;
    break;
  }


  r.animating = true;
  r.tick = 0;

  var div = document.getElementById( r.div + "_fg" );
  div.style.display = "block";
  div.style.left = r.keyframe[0].left + "px";
  div.style.top = r.keyframe[0].top + "px";
  div.style.width = slide.width;
  div.style.height = slide.height;

  var div_textbox = document.getElementById( r.div + "_textbox" );
  var div_text = document.getElementById( r.div + "_text" );
  div_text.style.display = "none";
  div_textbox.style.display = "none";
  div_textbox.style.height = slide.text_height;
  div_textbox.style.top = "0px";
  div_text.style.top = "0px";
  div_text.innerHTML = slide.text;


  if ( load_slide_request == false ){
      load_slide_request = new httpGet(slide.src,load_slide_request_ready_state_change);
      load_slide_request.send();
  }

}


function rotator_pause(){
  r.animating = false;
  generate_navigation();
}

function rotator_play(){

  generate_navigation();
  r.animating = true;
  animate();

}

function rotator_browse( i ){
  r.slide_num = i-1;
  r.animating = false;

  setTimeout(load_next_slide,2000 / r.animation_resolution);
}




function init_rotator(){
  div = document.getElementById( r.div );
  r.slide_num = -1;
  div.style.position = "relative";
  div.style.width = r.width;
  div.style.height = r.height;
  div.style.border = "1px solid black";
  div.style.overflow = "hidden";
  div.style.padding = "0px";


  //add the queue and the focus divs.
  //the queue is the slide in transit
  //the focus is the slide in focus.
  var new_inner_html = "<div id=\"" + r.div + "_bg\"></div>\n\r";
  new_inner_html += "<div id=\"" + r.div + "_fg\"></div>\n\r";
  new_inner_html += "<div id=\"" + r.div + "_navigation\"></div>\n\r";
  new_inner_html += "<div id=\"" + r.div + "_textbox\"></div>\n\r";
  new_inner_html += "<div id=\"" + r.div + "_text\"></div>\n\r";
  div.innerHTML = new_inner_html;

  //set up the foreground and background div styles
  var div_fg = document.getElementById( r.div + "_fg" );
  var div_bg = document.getElementById( r.div + "_bg" );
  var div_navigation = document.getElementById( r.div + "_navigation" );
  var div_textbox = document.getElementById( r.div + "_textbox" );
  var div_text = document.getElementById( r.div + "_text" );

  div_fg.style.display = "none";
  div_bg.style.display = "none";
  div_fg.style.position = "absolute";
  div_bg.style.position = "absolute";
  div_navigation.style.position = "absolute";
  div_navigation.style.top = (parseInt(r.height) - 40) + "px";

  div_textbox.style.position = "absolute";
  div_text.style.position = "absolute";
  div_text.style.left = -(parseInt(r.width)) + "px";
  div_textbox.style.left = -(parseInt(r.width)) + "px";
  div_text.style.top = "0px";
  div_textbox.style.top = "0px";
  div_textbox.style.opacity = r.textbox_opacity;
  div_textbox.style.filter = "alpha(opacity=" + (r.textbox_opacity*100) + ")";
  div_textbox.style.background = "#000000";
  div_textbox.style.width = r.width;
  div_text.style.width = r.width;
  div_textbox.style.height = "100px";
  div_text.style.padding = r.textbox_padding;
  div_text.style.color = r.textbox_color;
  div_textbox.style.margin = "0px";
  div_text.style.margin = "0px";


  //calculate some misc things
  r.slide_num = -1;
  r.num_slides = r.slide.length;
  r.paused = false;

  //start animating the rotator
  load_next_slide();
}

