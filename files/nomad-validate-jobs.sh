#!/bin/bash

prog=$(basename $0)

ss_workdir=""
ss_verbose=false
while getopts d:v arg; do
	case $arg in
		d) ss_workdir="${OPTARG}";;
		v) ss_verbose=true;;
		*) echo "$prog :: ERROR :: Bad arg - exiting"; exit 42;;
	esac
done

if [[ ! -d "${ss_workdir}" ]]; then
	echo "$prog :: ERROR :: cannot find $ss_workdir"
	exit 4
else
	fname=/usr/local/etc/bash.d/nomad.sh
	if [[ -r "$fname" ]]; then
		source $fname
	fi

	cd ${ss_workdir}
	for kk in *.nomad; do
		if $ss_verbose; then
			echo "# --------------------------------"
			echo $kk
			nomad job validate $kk
		else
			nomad job validate $kk > /dev/null 2>&1
			status=$?
			if ((status!=0)); then
				echo $kk
				nomad job validate $kk
			fi
		fi
	done
fi

exit 0
