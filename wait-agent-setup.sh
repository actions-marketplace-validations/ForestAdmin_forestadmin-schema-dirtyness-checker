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
  if echo $input | grep -q "$log_when_server_failed";
  then
    echo $input;
    cleanup;
    exit 2;
  else
    if (echo $input | grep -q "$log_when_setup") || (echo $input | grep -q "ForestAdmin server failed to find the project");
    then
      cleanup;
      exit 0;
    else
      echo $input;
    fi;
  fi;
done
