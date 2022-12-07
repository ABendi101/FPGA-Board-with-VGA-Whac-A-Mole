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



Citations
