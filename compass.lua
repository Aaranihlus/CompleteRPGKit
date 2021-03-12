compass = {}

function compass_init(e)
  compass_active = 1
  defn_Compass()
end


function compass_main(e)
   if compass_active == 1 then
     show_Compass()
   end
end

--***********************************
-- THE BELOW SECTION SHOULD NOT NEED EDITING. Be it on your head if you do. Line 70 (approx) has the display section.
--***********************************

-- **************************
function show_Compass ()
-- **************************
   local start=0
   local compass_str=""
   local bearing=0

   -- most efficient way I can find to return a 360 limited bearing from player rotation
   bearing  = math.floor(math.fmod(g_PlayerAngY, 360))

   -- hack due to negative Y angle on rotation - why devs?
   if bearing < 0 then bearing=bearing+360 end

   -- make sure we have full dimension on 10 degrees either side of actual bearing
   if bearing < 45 then
     start = 315 + bearing
   else
     start=bearing-45
   end

  local arraypos=start

   -- 91 is one quater of compass and 1 added for the array offset so we don't go out of bounds
   for i=1,91, 1 do
     if arraypos==360 or arraypos<=0 then
       arraypos=1 -- we reached end of table, reset
     else
       arraypos=arraypos+1
     end
     compass_str=compass_str..compass[arraypos]
    end -- for

    -- this works fine for a 1920 x 1080 display and *should* work on the horizontal but
  -- lack of fidelity in font size may cause vertical issues on lower resolutions.
   Panel(41,0,59,1)
   TextCenterOnXColor(50,2,2,compass_str,100,255,100)
   TextCenterOnXColor(50,3,2,"^",255,255,255)
   Panel(45,3,55,4)
   TextCenterOnXColor(50,5,3,bearing,255,255,255)
   TextCenterOnXColor(50,7,2,"Navigation Compass",155,155,155)
end  -- show

-- **************************
function defn_Compass()
-- **************************
   -- called once only at init()
   -- note that we need to offset the array by 1 because we can't have 0 as an array ref.
   for i=1, 360, 1 do
     if i == 1 then compass[i] = "N"
     elseif i == 46 then compass[i] = "NE"
     elseif i == 91 then compass[i] = "E"
     elseif i == 136 then compass[i] = "SE"
     elseif i == 181 then compass[i] = "S"
     elseif i == 226 then compass[i] = "SW"
     elseif i == 271 then compass[i] = "W"
     elseif i == 316 then compass[i] = "NW"

     -- pad out the non cardinals - suit yourself but watch the panel display sizing - I use | for every 10 and . for in between
     elseif math.fmod(i,10) == 1 then
       compass[i] = "|"
     else
       compass[i] = "."
     end
   end -- for
end -- defn
