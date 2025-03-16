#!/bin/bash

input_file="pp.in"
output_file="pp.out"
output_dir="ks_orbitals"

mkdir -p $output_dir

# Define the bands around the Fermi level
valence_band=10  # Adjust based on system
conduction_band=11  # Adjust based on system

# Modify pp.in with new kband values
sed "s/kband(1) = .*/kband(1) = $valence_band/" $input_file | \
sed "s/kband(2) = .*/kband(2) = $conduction_band/" > ${output_dir}/pp_kbands.in

# Run Quantum Espresso post-processing
pp.x < ${output_dir}/pp_kbands.in > ${output_dir}/$output_file

echo "KS orbitals extracted at the Gamma point."
