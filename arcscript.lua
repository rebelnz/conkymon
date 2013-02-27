--this is a lua script for use in conky
require 'cairo'

function conky_main()
   if conky_window == nil then return end
   local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
   cr = cairo_create(cs)

   font="Mono"
   font_size=12
   text="hello world"
   xpos,ypos=80,180
   red,green,blue,alpha=1,1,1,1
   font_slant=CAIRO_FONT_SLANT_NORMAL
   font_face=CAIRO_FONT_WEIGHT_NORMAL
   
   cpu0_perc = tonumber(conky_parse("${cpu cpu0}"))
   cpu1_perc = tonumber(conky_parse("${cpu cpu1}"))
   cpu2_perc = tonumber(conky_parse("${cpu cpu2}"))
   cpu3_perc = tonumber(conky_parse("${cpu cpu3}"))

   if cpu0_perc == nil then return end -- no value dont do anything         

   circle(120, 120, 40, -180, -180 + cpu0_perc*3.6,90,180,"CPU1:  "..cpu0_perc.."%")   
   bg_circle(120, 120, 40, -180, -180 + 360)

   circle(120, 240, 40, -180, -180 + cpu1_perc*3.6,90,300,"CPU2:  "..cpu0_perc.."%")   
   bg_circle(120, 240, 40, -180, -180 + 360)

   circle(120, 360, 40, -180, -180 + cpu2_perc*3.6,90,420,"CPU3:  "..cpu0_perc.."%")   
   bg_circle(120, 360, 40, -180, -180 + 360)

   circle(120, 480, 40, -180, -180 + cpu3_perc*3.6,90,540,"CPU4:  "..cpu0_perc.."%")   
   bg_circle(120, 480, 40, -180, -180 + 360)

   cairo_destroy(cr)
   cairo_surface_destroy(cs)
   cr=nil

end-- end main function


function arad(degrees)
   radians = degrees*(math.pi/180)
   return radians
end

function circle(mx,my,rad,sa,ea,txtx,txty,txt)
   cairo_set_source_rgba (cr,1,1,1,1)
   cairo_set_line_width(cr,4)
   cairo_arc(cr,mx,my,rad,arad(sa),arad(ea))
   
   cairo_select_font_face (cr, font, font_slant, font_face);
   cairo_set_font_size (cr, font_size)
   cairo_set_source_rgba (cr,red,green,blue,alpha)
   cairo_move_to (cr,txtx,txty)
   cairo_show_text (cr,txt)
   
   cairo_stroke(cr)      
end

function bg_circle(mx,my,rad,sa,ea)
   cairo_set_source_rgba (cr,0,1,1,.3)
   cairo_set_line_width(cr,8)
   cairo_arc(cr,mx,my,rad,arad(sa),arad(ea))
   cairo_stroke(cr)   
end


