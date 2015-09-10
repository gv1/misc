for i in {1..9}
do
  eval argi="$"$i""
  x=$((${argi:-30}*60));
  text="Alarm in $x seconds / $(($x/60)) minutes'"
  convert -pointsize 150 -fill red -draw "text 360,160 '$i'"  -pointsize 20 -draw "text 60,600 '$text'" magick:wizard - | display - &
  sleep $x
done
