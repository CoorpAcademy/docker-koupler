set -x

kinesisStreamName="bricklane-development"

while [[ 1 ]]
do
  testData="TestStringDate__`date +%s`"
  aws kinesis put-record --stream-name $kinesisStreamName --partition 123 --data $testData
  sleep 5
done

