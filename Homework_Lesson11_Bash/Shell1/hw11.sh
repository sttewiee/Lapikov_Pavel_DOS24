#!/bin/bash

# Proveryayem, peredayem li vse podtverzhdennyye argumenty
if [ $# -ne 3 ]; then
    echo "Oshibka,neobhodimo 3 argumenta!"
    echo "Trebovaniya: $0 <imya_faila> <pyt'_k_faily> <rasshireniye>"
    exit 1
fi

# Prisvaivayem argumenty peremennym
output_file=$1   # imya faila
directory=$2     # pyt'
extension=$3     # rasshirenie

# Proveryayem, sushchestvuyet li ukazannyy katalog
if [ ! -d "$directory" ]; then
    echo "Oshibka: Catalog '$directory' ne naiden!"
    exit 2
fi

# Nakhodim vse fayly s nuzhnym rasshireniyem v ukazannoy direktorii i zapisyvayem v fayl
find "$directory" -type f -name "*.$extension" > "$output_file"

# Proveryayem, byl li sozdan fayl s effektom
if [ $? -eq 0 ]; then
    echo "Rezultat zapisan v file '$output_file'."
else
    echo "Oshibka zapisi v file '$output_file'."
    exit 3
fi
