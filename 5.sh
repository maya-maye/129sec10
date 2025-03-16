#!/bin/bash

input_file="bands.graphene.in"
output_file="bands.out"
bands_data="bands.dat"
gnuplot_script="bands.gnuplot"
output_dir="band_results"

mkdir -p $output_dir

# Run Quantum Espresso for band structure
pw.x < $input_file > $output_dir/$output_file

# Extract band data
bands.x < $input_file > $output_dir/$bands_data

# Generate gnuplot script
cat <<EOF > $output_dir/$gnuplot_script
set terminal png
set output "band_structure.png"
set xlabel "k-path"
set ylabel "Energy (eV)"
plot "$bands_data" using 1:2 with lines title "Band Structure"
EOF

# Run gnuplot
gnuplot $output_dir/$gnuplot_script

echo "Band structure calculation complete. Saved as band_structure.png."
