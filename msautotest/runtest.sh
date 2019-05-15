#!/bin/bash

check_image() {
    img=$(basename $1)
    ext=${img/*./}
    if [ "$ext" == "xml" -o "$ext" == "dat" -o "$ext" == "txt" ]
    then
      r=$(diff expected/$img result/$img | wc -l)
      ### printf "%d\n" $((r*100000))
      echo 666
    else
      compare -fuzz 2% expected/$img result/$img - 2>/dev/null \
      | convert - -threshold 50% -format %c histogram:info: \
      | awk '
        BEGIN {b=0;w=0}
        {sub(":"," ")}
        / #000000 /{b=$1}
        / #FFFFFF /{w=$1}
        / #000000000000 /{b=$1}
        / #FFFFFFFFFFFF /{w=$1}
        END { r=b*1e6/(b+w);print int(r+0.5) }
      '
    fi
}

run_test_py() {
  echo $1
  shift
  gr="/-\|"
  i=1
  for test in $*
  do
    cut -c$i <<< $gr
    i=$(($i%4+1))
    tput cuu1
    fails=$(./run_test.py $test 2>/dev/null \
      | awk '
        / Processing: /{
          sub(/\.map/,"",$2);
          mapfile=$2;
          "basename expected/"mapfile".* 2>/dev/null"|getline test
          }
        /   test /{test=$2}
        / TEST FAILED./{print test}
      ')
    if [ -n "$fails" ]
    then
      ff=""
      for f in $fails
      do
        ppm=$(check_image $f 2>/dev/null)
        if [ -z "$ppm" ]
        then
          ff="$ff >$f<"
        elif [ $ppm -gt 8000 ]
        then
          ff="$ff $f"
        fi
      done
      if [ -n "$ff" ]
      then
        echo "Mapfile:" $test
        printf "    %s\n" $ff
      fi
    fi
  done
}

cd gdal
rm -rf result/
list=$(printf "%s\n" *.map \
# | grep -v -E \
#   '(offsite_pct_rgb|offsite_pct_rgb_torgb|tileindexmixedsrs.*).map'
  )
run_test_py gdal $list
cd ..

cd misc
rm -rf result/
list=$(printf "%s\n" *.map)
run_test_py misc $list
cd ..

cd query
rm -rf result/
list=$(printf "%s\n" *.map)
run_test_py query $lisy
cd ..

python3 -m http.server 8000 >&/dev/null & wid=$!

cd renderers
rm -rf result/
list=$(printf "%s\n" *.map)
run_test_py renderers $list
cd ..

cd wxs
rm -rf result/
list=$(printf "%s\n" *.map)
run_test_py wxs $list
cd ..

kill $wid 2>/dev/null

