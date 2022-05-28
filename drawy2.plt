stats 'data2.txt' nooutput
set ylabel "y2"
set xlabel "t"
set xrange [0:200]
set yrange [-2:2]
set tics font "arial,15"
set terminal png size 1024, 1024 
z=""
do for [i=0:int(STATS_blocks)-1] {
    if (i<10) {z = "00"} else { 
        if (i<100)  {z = "0"} else {z = ""}
    }
	set output 'x'.z.i.'.png' 
   plot 'data2.txt' index i with lines title "1" lc rgb "black" lw 2
}