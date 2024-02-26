#!/bin/zsh

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0 <shellcode.macho|shellcode.o>"
    exit 1
fi

for c in $(objdump -d $1 | grep -E '[0-9a-f]+:' | cut -f 1 | cut -d : -f 2) ; do
	echo $c | sed 's/\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)/"\\x\7\8\\x\5\6\\x\3\4\\x\1\2"/'
done

echo
