#!/usr/bin/gnuplot -persist
#Opened gnuplot programme in terminal

#For each NEW plot: 4 things to fix

#-----------------Plotting----------------------
#Plot first main diagrams and fix titles


set datafile separator ', '

#----------For Four tiles
plot "FFT-run935-chan2.txt" u 1:2 w l t "Tile 9 and 10 and 12 and 13 (full Q4) at LV=7V" lc "light-pink" #Tile 1and2and3and4
replot "FFT-run936-chan2.txt" u 1:2 w l t "Tile 9 and 10 and 11 and 12 (full Q4) at LV=7.5V" lc "violet" #Tile 1and2and3and4
replot "FFT-run937-chan2.txt" u 1:2 w l t "Tile 9 and 10 and 11 and 12 (full Q4) at LV=8V" lc "dark-pink" #Tile 1and2and3and4
replot "FFT-run938-chan2.txt" u 1:2 w l t "Tile 9 and 10 and 11 and 12 (full Q4) at LV=8.2V" lc "dark-violet" #Tile 1and2and3and4



#-------------------------
#-----------Overlaying
# COPY here from above to overlay between them in whichever order wanted





#--------------Calculation plots
#REMEMBER TO CHANGE "set datafile separator ','"
#set datafile separator "\t"
#replot "alltiles12_quadrant1.txt" u 1:($6-$2)  w l t "Tiles 1and2 - Tile 1" lc "plum" #Tile 1and2 - Tile1
#replot "alltiles12_quadrant1.txt" u 1:($6-$4)  w l t "Tiles 1and2 - Tile 2" lc "dark-pink" #Tile 1and2 - Tile2

#plot "alltiles12_quadrant1.txt" u 1:($4-$2)  w l t "Tile 2 - Tile 1" lc "violet" #Tile 1and2 - Tile1

#---------------Manually averaged plots
#plot "alltiles12_quadrant1.txt" u 1:6 w l t "Tiles 1 and 2" lc "purple", "" u 1:($2+$4)/2 w l t "(Tile 1 + Tile 2)/2" lc "sienna1"
#plot "alltiles123_quadrant1.txt" u 1:8 w l t "Tiles 1 and 2 and 3" lc "slateblue1", "" u 1:($2+$4+$6)/3 w l t "(Tile 1 + Tile 2 + Tile 3)/3" lc "orange-red"


#----------Graphic art---------------
set title "COLD Noise for vPDU4 | Quadrant 3 tiles"
set xlabel "Frequency [MHz]"
set ylabel "Intensity [dBm/Hz]"
replot

#-------------------Saving---------------------
#Save plots in folder 
set term png

#------Plain tile plots
#set output "./simple_plots/noise_tile2.png"
#set output "./simple_plots/noise_tile1and2and3and4.png"
#set output "noise_tile1and2and4.png"

#------Overlays
#set output "noise_overlay_tile2and3and4_tile1and3and4_tile1and2and4.png"
set output "./overlays/noise_overlay_tile1andand2and3and4_changeLV.png"

#------Minus
#set output "noise_overlay_tile1and2_minus_tile12.png"
#set output "noise_overlay_tile2_minus_tile1.png"

#-------Average
#set output "noise_overlay_tile1and2and3_avg_tile1and2_tile3.png"

replot
set term x11



#-------------Calculating ratios between maxima spikes-----------------------
# Define two helper functions
#ismin(x) = (x<min)?min=x:-165
#ismax(x) = (x>max)?max=x:-110

# Initialise the 'global' vars
#max=-110
#min=-165

# Run through the data and pass it to the helper functions.
# Any expression for the 'using' will do, as long as it contains both
# helper functions
#set xrange [15:28]

#-------------
#wc -l alltiles12_quadrant1.txt -> 499999 alltiles12_quadrant1.txt
#----------------

#plot "< tail -n +100000 alltiles12_quadrant1.txt" u 5:6 w lines

#plot "< tail -n +100000 alltiles12_quadrant1.txt" u 5:(ismin($6)*ismax($6))

# Now, max and min will hold the maximum and minimum of column 0 of
# your data

#print "Max for Tiles 1and2 is: ", max
#print "Min for Tiles 1and2 is: ", min


exit

#---------------------------------------------------
#Author of this script:
#Lucy Kotsiopoulou
#PhD studennt
#University of Edinburgh
#
#Inspired by: Dr. ANdrzej Szelc (Supervisor)
#
#First started on: 20/11/2023
#
#Please provide credit when sharing
#----------------------------------------------------

