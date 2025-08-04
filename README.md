# API CI Testing Framework

API testing framework built with Postman and Newman for CI/CD pipelines.

## 🚀 Quick Start

```bash
# Install dependencies
npm install --legacy-peer-deps
npm install -g newman newman-reporter-html newman-reporter-json

# Setup project
make setup

# Run tests
make test-local
make test-all
```

## 📁 Project Structure

```
api-ci/
├── collections/          # Postman Collections
├── environments/         # Environment Configurations
├── scripts/             # Automation Scripts
├── reports/             # Test Results & Artifacts
├── .github/             # CI/CD Workflows
└── docs/               # Documentation
```

## 🛠️ Prerequisites

- **Node.js** >= 18.0.0
- **Newman CLI** >= 6.0.0
- **Postman** (optional - for collection editing)
- **json-server** (for local testing)

## 🔧 Environment Configuration

### Local Development
```bash
newman run collections/api-tests.json -e environments/local.json
```

### Staging Environment
```bash
newman run collections/api-tests.json -e environments/staging.json
```

### Production Environment
```bash
newman run collections/api-tests.json -e environments/production.json
```

## 🧪 Test Execution

### Manual Execution
```bash
# Using shell script
./scripts/run_tests.sh [environment]

# Using npm scripts
npm run test:local
npm run test:staging
npm run test:production
```

### Automated Execution
```bash
# Run all environments
make test-all

# Run specific environment
make test-local
make test-staging
make test-prod
```

## 🔄 CI/CD Integration

The framework includes GitHub Actions workflows that automatically:

- ✅ Execute tests on every push to main/develop branches
- ✅ Run tests on pull requests
- ✅ Generate comprehensive reports
- ✅ Post results as PR comments
- ✅ Upload artifacts for analysis

### Workflow Triggers
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches
- Manual workflow dispatch

## 📊 Test Collections

### Core API Tests
- **Get Users**: Retrieve all users from the API
- **Create User**: Add new user to the system
- **Get User by ID**: Fetch specific user details
- **Update User**: Modify existing user information
- **Delete User**: Remove user from the system

### Test Coverage
- **Status Code Validation**: Ensures correct HTTP responses
- **Response Time Monitoring**: Tracks API performance
- **Data Integrity**: Validates response structure
- **Error Handling**: Tests failure scenarios

## 📈 Reporting & Analytics

### Report Types
- **HTML Reports**: Visual test results with detailed metrics
- **JSON Reports**: Machine-readable data for automation
- **CLI Reports**: Real-time console output

### Metrics Tracked
- Test execution time
- Request/response statistics
- Error rates and types
- Performance benchmarks
- Coverage analysis

## 🌍 Environment Management

### Configuration Files
- `environments/local.json` - Development environment (localhost:3000)
- `environments/staging.json` - Pre-production testing
- `environments/production.json` - Live environment

### Environment Variables
- API endpoints and base URLs
- Authentication credentials
- Timeout configurations
- Feature flags and toggles

## 🔒 Security Considerations

- Environment-specific API keys
- Secure credential management
- HTTPS enforcement for production
- Rate limiting and throttling
- Audit logging and monitoring

## ⚡ Performance Optimization

- Parallel test execution
- Connection pooling
- Request caching strategies
- Resource cleanup procedures
- Memory management

## 🐛 Troubleshooting

### Common Issues
1. **Network Connectivity**: Verify firewall and proxy settings
2. **Authentication**: Check API keys and token validity
3. **Timeout Errors**: Adjust request timeouts in environment config
4. **SSL Issues**: Verify certificate validity and trust chains

### Debug Mode
```bash
# Enable verbose logging
newman run collections/api-tests.json -e environments/local.json --verbose

# Debug specific test
newman run collections/api-tests.json -e environments/local.json --bail
```

## 🧪 Local Testing Setup

### Start Test Server
```bash
# Install json-server
npm install -g json-server

# Start server
json-server --watch db.json --port 3000
```

### Run Tests
```bash
# Basic test run
newman run collections/api-tests.json -e environments/local.json

# With reports
newman run collections/api-tests.json -e environments/local.json -r html,json --reporter-html-export reports/report.html --reporter-json-export reports/report.json
```

## 📊 Test Results

### Expected Output
```
newman

API Tests

→ Get Users
  GET http://localhost:3000/users [200 OK, 743B, 16ms]
  ✓  Status 200

→ Create User
  POST http://localhost:3000/users [201 Created, 399B, 5ms]
  ✓  Status 201

→ Get User by ID
  GET http://localhost:3000/users/2 [200 OK, 392B, 1ms]
  ✓  Status 200

→ Update User
  PUT http://localhost:3000/users/2 [200 OK, 397B, 2ms]
  ✓  Status 200

→ Delete User
  DELETE http://localhost:3000/users/2 [200 OK, 397B, 4ms]
  ✓  Status 200
```

### Performance Metrics
- **Average Response Time**: 5ms
- **Total Requests**: 5
- **Success Rate**: 100%
- **Test Duration**: ~95ms


## 📄 License

MIT License - see LICENSE file for details

