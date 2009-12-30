r = {

  /*
    Note: All time and speed measurments are in seconds
  */

  "div":"ad_rotator1",
  "width":"673px",
  "height":"327px",
  "animation_resolution":25,           //frames per second
                                       //60 = very smooth (not all CPUs can perform this fast)
                                       //4 = very choppy ()

  "pause_image":"images/banner/pause.gif",
  "play_image":"images/banner/play.gif",


  "textbox_background":"#000000",
  "textbox_opacity":0.5,
  "textbox_color":"white",
  "textbox_padding":"5px 10px 5px 10px",        //top right bottom left

  "slide":
  [

    //*************************
    //SLIDE 1 - Pipes
    //*************************
    {

      //when adding text to an animation, add a '\' to the end of the line
      //avoid using " tokens in your HTML, use ' or \" instead
      "text":"<b>Image 1</b><br/>\
              Aqui vai o texto desta imagem",

      "text_height":"20%",              //size of textbox
                                        //choices are %, px, pt, and em
      "text_animation":"slide_from_top",


      "exposure_length":5,           //in seconds


      "transition":"fade",  //options:
                                       //slide_from_left
                                       //slide_from_right
                                       //slide_from_top
                                       //slide_from_bottom
                                       //fade

      "transition_speed":0.5,            //in seconds


      "type":"image",                 //options: html, image, or flash
      "src":"images/banner/teste1.jpg",


      //Images have two extra options for linking:
      "link_to" : "http://www.google.com.br/",
      "target" : "window",            //options: window, none



      "width":"673px",
      "height":"327px",

      "animation":"slide_down_and_up",   //options:
                                         //slide_right_and_left
                                         //slide_down_and_up
                                         //none

      //sliding animations have two options
      "animation_speed":30,
      "pause_speed":30

    },


    //*************************
    //SLIDE 2 - Blue thing
    //*************************
    {
      "text":"<b style='color:white;font-size:14px'>Imagem 2 </b><br/>\
      Texto sobre a imagem aqui",

      "text_height":"20%",
      "text_animation":"slide_from_top",

      "exposure_length":5,

      "transition":"fade",
      "transition_speed":0.5,

      "type":"image",
      "src":"images/banner/teste2.jpg",
      "link_to" : "http://www.terra.com.br/",
      "target" : "main",
      "width":"673px",
      "height":"327px",

      "animation":"slide_right_and_left",
      "animation_speed":30,
      "pause_speed":30
    },


    //*************************
    //SLIDE 3 - Escalators
    //*************************
    {
      "text":"<b>Texto sobre a imagem 3",

      "text_height":"20%",
      "text_animation":"slide_from_left",

      "exposure_length":5,

      "transition":"fade",
      "transition_speed":0.5,

      "type":"image",
      "src":"images/banner/teste3.jpg",
      "link_to" : "http://www.youtube.com/",
      "width":"673px",
      "height":"327px",

      "animation":"none",
      "animation_speed":30,
      "pause_speed":30
    },

	//*********************************
	// Slide 4 -
	//********************************


	 {
      "text":"<b>Texto sobre a imagem 4",

      "text_height":"20%",
      "text_animation":"slide_from_left",

      "exposure_length":5,

      "transition":"fade",
      "transition_speed":0.5,

      "type":"image",
      "src":"images/banner/teste4.jpg",
      "link_to" : "http://www.youtube.com/",
      "width":"673px",
      "height":"327px",

      "animation":"none",
      "animation_speed":30,
      "pause_speed":30
    },






    //*************************
    //SLIDE 5 - Architecture
    //*************************
    {
      "text":"Texto sobre a imagem 5",
      "text_height":"20%",
      "text_animation":"slide_from_right",
      "exposure_length":5,

      "transition":"fade",
      "transition_speed":0.5,

      "type":"image",
      "src":"images/banner/teste5.jpg",
      "link_to":"http://www.terra.com.br/",
      "width":"673px",
      "height":"327px",

      "animation":"slide_right_and_left",
      "animation_speed":30,
      "pause_speed":30
    }



  ]
}

