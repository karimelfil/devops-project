#!/bin/bash
echo "🧪 MANUAL TEST SCRIPT"
echo "====================="

echo "1. Stopping any existing containers..."
docker-compose -f docker-compose.test.yml down 2>/dev/null

echo "2. Starting test environment..."
docker-compose -f docker-compose.test.yml up -d

echo "3. Waiting for services..."
sleep 20

echo "4. Checking containers status..."
docker-compose -f docker-compose.test.yml ps

echo "5. Testing web application..."
echo "Trying: curl http://localhost:8081"
curl -s http://localhost:8081
CURL_RESULT=$?
echo ""

if [ $CURL_RESULT -eq 0 ]; then
    echo "✅ Web app is responding!"
else
    echo "❌ Web app not responding"
fi

echo "6. Showing test logs..."
docker-compose -f docker-compose.test.yml logs tester --tail=20

echo "7. Stopping containers..."
docker-compose -f docker-compose.test.yml down

echo ""
echo "====================="
echo "Manual test complete!"
