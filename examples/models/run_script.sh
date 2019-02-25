REDIS_CLI=../../deps/redis/src/redis-cli

echo "SET SCRIPT"
# $REDIS_CLI -x AI.SCRIPTSET foo CPU < script_err.txt
$REDIS_CLI -x AI.SCRIPTSET fooz CPU < script.txt

echo "SET TENSORS"
$REDIS_CLI AI.TENSORSET a FLOAT 2 VALUES 2 3
$REDIS_CLI AI.TENSORSET b FLOAT 2 VALUES 2 3

echo "GET TENSORS"
$REDIS_CLI AI.TENSORGET a VALUES
$REDIS_CLI AI.TENSORGET b VALUES

echo "RUN SCRIPT"
$REDIS_CLI AI.SCRIPTRUN foo bar INPUTS a b OUTPUTS c

echo "GET TENSOR META"
$REDIS_CLI AI.TENSORGET c META

echo "GET TENSOR VALUES"
$REDIS_CLI AI.TENSORGET c VALUES

echo "GET TENSOR BLOB"
#$REDIS_CLI --raw AI.TENSORGET c BLOB
$REDIS_CLI AI.TENSORGET c BLOB

