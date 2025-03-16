#!/bin/bash

input_file="pw.graphene.scf.in"
output_dir="lattice_results"
ecutwfc=40  # Example value, adjust if needed

mkdir -p $output_dir

# Loop over lattice constants from 0.4 to 0.7 with 10 points
for b in $(seq 0.4 0.03 0.7); do
    new_input="${output_dir}/pw_b${b}.in"
    new_output="${output_dir}/pw_b${b}.out"

    # Modify lattice parameter
    sed "s/celldm(2) = .*/celldm(2) = $b/" $input_file > $new_input

    # Run Quantum Espresso calculation
    pw.x < $new_input > $new_output
done

# Extract total energy and save to a file
grep "!" ${output_dir}/pw_b*.out | awk '{print $NF}' > ${output_dir}/energies.txt

echo "Lattice scan complete. Energies stored in ${output_dir}/energies.txt."
