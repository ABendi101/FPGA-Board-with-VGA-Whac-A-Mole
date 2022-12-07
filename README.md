# FPGA-Board-with-VGA-Whac-A-Mole
Whac-A-Mole through a DE2-115 FPGA board with a VGA module.


Necessary Back Ground Info:

Creators: Alex Benintendi and Rajeev Rangaraju

Class: ECE 287 Digital System Design

Game: Whac-A-Mole with VGA, lights, and 10 different levels of difficulty as well as a start/end and pause/unpause button.

Basic Information:

In simple form this game is designed to be played on a FPGA board where you flip switches to "whac" the so-called "moles" that are displayed through VGA to a monitor as well as lights above each switch for ease. You score will be kept on the seven segment display as well as the difficulty level. You must hold down the Start button(far right) to begin to play as well as to help hinder your ability to use both hands. You then start flipping the switches to gain points and whack the moles. The difficulty of the game will go up on it's own after you reach enough points however, if you want to bump up the difficulty yourself use the second button from the right to go up and second button from the left to go down. If you want to pause the game at any time, the far left button will do this. There you have it, Whac-A-Mole!

The main file(wam_main.v) instantiates many other files and modules as well as a VGA module which instantiates many in it's own. The main file (wam_main.v) uses a score module (wam_scr.v), a module that generates moles (wam_gen.v), a hit module (wam_hit.v), a display module (wam_dis.v) with 2 seven segment modules(seven_segment_v and seven_segment_negative.v) where one is for displaying the score and the difficulty level, and one is to display a negative sign if anyone ever wanted to build off my design and add negative points for "missing" a mole. A difficulty module is instantiated as well (wam_hrd.v). Then we have the VGA side of things which is a main module (projectVGA.v) which has 5 module instantiated into it (ractangle.v, vga_controller.v, vga_adapter.v, vga_address_translator.v, vga_pll.v). All these files work together and create the whac-a-mole game. The main difficulty in this game was finding a way for a VGA module to display moles appearing completely random and all independently of each other.
 
 
 
  
 
 
Detailed Run Down (Module design)

The game runs off of the wam_main.v module which calls out the many different modules to complete tasks for it. Since this game runs on a 50MHz clock, the game is constantly instantiating these other modules so they update the display almost instantaneously. I will explain how the game it'self works and then Get into the display of the board and the VGA.

When it boots up the first condition checked is to see whether or not the "clr" button is on. If you aren't holding down the far right button it will read clr as being equal to 1 because it's active high so when you press the button, the clr will go down to zero and the game will begin. This is all written in the wam_main1() module in FSM's. Constantly checking this condition as well as the pause condition. If the pause button is pressed then the entire game will freeze.

The first module (other than wam_main1()) to dive into, is the wam_hrdn.v module. Within this module we have wam_hrdn() and wam_par(). wam_hrdn() reads what level of difficulty the game is set to. This then sends information back to wam_main.v about how hard the game is.

The wam_gen.v module then takes in the hardness level of the game. In this module we have wam_gen() and wam_rdn(). wam_rdn() creates a random number 0-7 to decide which hole a mole will appear in. wam_gen() calls out to the wam_par() module within wam_hrdn.v and assigns values to the age of the mole by using the hardness level we discussed. Then wam_gen() uses all this information to generate the moles. It does this constantly as well.

We then have a wam_hit.v fild with 2 modules within; wam_tap() and wam_hit(). wam_taap() is constantly read the switches to see which ones are turned on. It then send this information to wam_hit(). wam_hit() then checks whether or not there was in fact a mole at the switch that was turned on. If there was it will send a positive hit result if not it wont. It sends this information back to wam_main.v.

Then information is sent on into wam_scr.v. This File contains wam_scr() and wam_cnt(). wam_scr() receives a positive hit signal and adds to the score and returns it to wam_main.v. wam_cnt() is there incase you wanted to enlarge the scoring capabilities of the design however for our purpose we kept it by 1's and only needed 2 seven segment decoders.

While all this is going on, the wam_dis.v is displaying on the FPGA board. It takes in the "score" register. Within wam_dis.v we have wam_dis(), wam_led(), and wam_lst(). wam_main.v calls on wam_led() directly and sends it the "holes" register telling you what moles are up and which ones aren't. wam_led() then turns the led's on above the switches where there is a mole. wam_lst() is also called straight from the main module and tells it the difficulty level. All this info is sent into wam_dis() where is uses the seven segment decoders to display the score and difficulty. The seven segment decoder files are instantiated within wam_dis().

Onto the interesting part, VGA Display: The projectVGA.v file works as a home base module for the rest of the VGA modules. vga_adapter.v, vga_address_translater.v, vga_controller.v, and vga_pll.v were part of one big zip file credited to Chris Lallo and all the following information about the files was written in the files already.

vga_adapter.v: This is an implementation of a VGA Adapter. The adapter uses VGA mode signalling to initiate a 640x480 resolution mode on a computer monitor, with a refresh rate of approximately 60Hz. It is designed for easy use in an early digital logic design course to facilitate student projects on the Altera DE2 Educational board. This implementation of the VGA adapter can display images of varying colour depth at a resolution of 320x240 or 160x120 superpixels. The concept of superpixels is introduced to reduce the amount of on-chip memory used by the adapter. The following table shows the number of bits of on-chip memory used by the adapter in various resolutions and colour depths.

vga_address_translator.v: This module converts a user specified coordinates into a memory address. The output of the module depends on the resolution set by the user. Set this parameter to "160x120" or "320x240". It will cause the VGA adapter to draw each dot on the screen by using a block of 4x4 pixels ("160x120" resolution) or 2x2 pixels ("320x240" resolution). It effectively reduces the screen resolution to an integer fraction of 640x480. It was necessary to reduce the resolution for the Video Memory to fit within the on-chip memory limits.

vga_controller.v: Go through each line of the screen and read the colour each pixel on that line should have from the Video memory. To do that for each (x,y) pixel on the screen convert (x,y) coordinate to a memory_address at which the pixel colour is stored in Video memory. Once the pixel colour is read from video memory its brightness is first increased before it is forwarded to the VGA DAC.

vga_pll.v: This module is what facilitates the communication between the monitor and the board by using the clocks and such.

As for what you see when playing:

All you have to worry about when editing the visuals of the game, is the projectVGA.v file and the rectangle.v file. The rectangle.v file was preset for me to draw only a rectangle, given to me by Jacob Gardner. The manipulation of the finite state machines and implementation of another always block is where the moles and holes comes into play.

projectVGA.v is nothing more than a middle man between the wam_main.v file, and the rectangle.v and vga_adapter.v files. The wam_main.v file instantiates the projectVGA.v file and thats it for vga files in wam_main.v. The instantiation of the rectangle.v and vga_adapter occurs within projectVGA.v.

The general idea of our vga system is that we continuously recreate our background to the game. So every pixel is constantly being replaced because the FSM works on a constant clock. The question then, is if the pixel is in a location where there MIGHT be a mole or a hole. So within a alway block it shall check to see if it's in the location of a hole and then will see if there is actually a mole there, and changes the color of that pixel accordingly. To see how we did this ill go into more depth.

projectVGA.v is passed in clk, rst, plot, hole, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK. clk is constant, rst is always 1 because we never want the display to disappear mid game, and plot is always 1 because of the same reason. VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK are all pins for the FPGA board to communicate through the VGA cable the right way and display what we want it to. The only thing we really worry about at first is "hole".

wam_main.v passes in the 8 bit register called "hole". projectVGA then sends this into rectangle.v. rectangle.v didn't initially have a port for this so it had to be added to the port list. I then created a whole new always block with many if statements that checked the x and y values of the current pixel it was manipulating. If the pixel was within a certain range, it changed the color to a hole color I chose(some shade of brown). It does this the second the game loads into the FPGA. Once the moles start forming the "holes" register I was talking about is checked in the always block. So lets say holes 1 and 3 have moles, then the back will recreate itself pixel by pixel and check to see what color it should be. The if statements for holes 1 and 3 check pixels in those areas of the screen we want a mole, and if it lies within a certain range of x and y, the color is changed. This is done so fast that the moles will show up even though they work independently of each other.

The only issue we ran in to is that since the preset FSM was only set up to make a rectangle once and stop, I had to make it continuously run by changing the final state and send back to the initial state "START".




Citations

Initial modules for the BASYS 2 FPGA board credit GitHub Handle: nyLiao

Vga Module zip(vga_adapter.v, vga_controller.v, vga_address_translator.v, vga_pll.v) credit: Chris Lallo

Initial set up for rectangle generation: Jacob Gardner
