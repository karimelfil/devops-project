#!/bin/sh
echo "========================================"
echo "         CI/CD TEST RUNNER"
echo "========================================"
echo "Waiting for services to be ready..."
sleep 15

echo "Checking if web service is reachable..."
curl -f http://web:80 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Web service is up"
else
    echo "❌ Web service not responding"
    exit 1
fi

echo "Running Node.js tests..."
node test.js
TEST_RESULT=$?

echo "========================================"
echo "Test completed with exit code: $TEST_RESULT"
echo "========================================"

exit $TEST_RESULT
