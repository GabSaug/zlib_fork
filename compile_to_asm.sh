# $1: name of the c file to compile to assembly
# $2 output path
opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -fno-inline -Wno-error -finline-limit=2"
if ! gcc $opt -Wno-error -finline-limit=2 -masm=intel -fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -S -o "$2" "$1" ; then
	echo "error"
	exit 1
fi
