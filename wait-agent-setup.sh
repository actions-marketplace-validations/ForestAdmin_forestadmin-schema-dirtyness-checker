#bin/bash
set -Eeou pipefail;

log_when_setup=$1
log_when_server_failed=$2

cleanup()
{
  echo "Killing agent process"
  kill $(<pid)
  sleep 1;
}

while read input
do
  echo $input
  if echo $input | grep -q $log_when_server_failed;
  then
    cleanup;
    exit 2;
  else
    if [echo $input | grep -q $log_when_setup] || [echo $input | grep -q "ForestAdmin server failed to find the project"];
    then
      cleanup;
      exit 0;
    fi;
  fi;
done
