require "rubygems"
#require 'win32/sound'
#include Win32
load "visual_indicator.rb"

print "Running\n"

for lamp in VisualIndicator.all
END {
  lamp.all.off
}
  lamp.open_device
  lamp.start_buzzer(2, 2, 6, 2)
  lamp.stop_buzzer

 # lamp.green.off
 # lamp.red.off
 # lamp.yellow.off
 # lamp.yellow.off
  	
	
  	LED_COLORS  = Array.new(3)
	LED_COLORS[0] = lamp.green
	LED_COLORS[1] = lamp.red
	LED_COLORS[2] = lamp.yellow
	LED_COLORS[3] = lamp.all
	
	#for j in ( 1..10)
	while (true)
	previous = 0
	time = Time.new
	puts time.hour 
	puts time.hour.between?(8,12) 
	puts time.hour.between?(13,21) 
	# Check the time if it is between 8-12 and 1-5 enable
		while (time.hour.between?(8,12) || time.hour.between?(13,17) )
				
			brightness = rand(100)
			j = rand(60)
			delay = rand(30)
			color = rand(4)
			
			print "Delay=",delay, "-Brightness=",brightness,"rand_color=",color,"onetosixty=",j,"\n"
			
			if j % 5 == 0 && previous != j then
				print "j%5","\n"
				steps = [5,7,8,10,20,30,40,50,60,70,80,90,100]
				steps += steps.reverse
				steps.each do  |stepBright|
					#print "step=",stepBright,"\n"
					lamp.red.on stepBright
					lamp.green.on stepBright
					sleep 2
				end
				#lamp.red.off 
				#lamp.green.off 	
			elsif j%3 ==0 && previous != j then
				print "j%3","\n"
				steps = [5,7,8,10,20,30,40,50,60,70,80,90]
				steps += steps.reverse
				steps.each do  |stepBright|
					#print "step=",stepBright,"\n"
					lamp.yellow.on stepBright
					lamp.green.on stepBright
					sleep 2
				end
				#lamp.yellow.off 
				#lamp.green.off
			elsif j%4 == 0 && previous != j then 
				print "j%4","\n"
				steps = [5,7,8,10,15,25,35,45,55,65,75,85,90,100]
				steps += steps.reverse
				steps.each do  |stepBright|
					LED_COLORS[color].on stepBright	
					sleep 2
				end
				#LED_COLORS[color].off
			
			else	
				print "one","\n"
				LED_COLORS[color].on brightness	
			end
			
			#if (LED_COLORS[color].flash)
			
			sleep(delay)
			
			#LED_COLORS[color].off
			# Check the time if it is between 8-5 enable
			lamp.all.off
			#LED_COLORS[i+1].off
			#LED_COLORS[i+2].off
			previous = j
		end
	sleep 60 # check every minute
	end
	
  #Close the device
  lamp.close_device
end
