const http = require('http');

console.log('🚀 Starting API test...');
console.log('Testing endpoint: http://web/');

const options = {
  hostname: 'web',
  port: 80,
  path: '/',
  method: 'GET',
  timeout: 30000
};

const req = http.request(options, (res) => {
  console.log(`📡 Status Code: ${res.statusCode}`);
  
  let data = '';
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    console.log(`📄 Response: ${data}`);
    
    if (res.statusCode === 200 && data.includes('Hello World')) {
      console.log('✅ TEST PASSED: Response contains "Hello World"');
      process.exit(0);
    } else {
      console.log('❌ TEST FAILED: Invalid response');
      console.log(`Expected: Hello World in response`);
      console.log(`Got: ${data}`);
      process.exit(1);
    }
  });
});

req.on('error', (error) => {
  console.error('❌ Request error:', error.message);
  process.exit(1);
});

req.on('timeout', () => {
  console.error('❌ Request timeout');
  req.destroy();
  process.exit(1);
});

req.end();
