#Contador de secuencias de Cytb

#!/bin/bash

# Definir la variable con el nombre del archivo
fasta_cytb="CytBDNA.txt"

# Verificar si el archivo existe
if [ ! -f "$fasta_cytb" ]; then
    echo "El archivo $fasta_cytb no existe."
    exit 1
fi

# Contar líneas que empiezan con '>'
sequence_count=$(grep -c "^>" "$fasta_cytb")

# Mostrar resultados
echo "Archivo analizado: $fasta_cytb"
echo "Número de secuencias encontradas: $sequence_count"
