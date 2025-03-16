set terminal png
set output "band_structure.png"
set xlabel "k-path"
set ylabel "Energy (eV)"
plot "bands.dat" using 1:2 with lines title "Band Structure"
