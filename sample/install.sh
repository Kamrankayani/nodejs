#!/bin/bash
# Creates a sample Node.js app with CI/CD workflow

mkdir -p sample-node-app/{routes,tests,.github/workflows}
cd sample-node-app || exit

# package.json
cat > package.json << 'EOF'
{
  "name": "sample-node-app",
  "version": "1.0.0",
  "description": "Sample Node.js app for CI/CD with GitHub Actions",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "jest",
    "lint": "eslint .",
    "build": "echo 'Build step (if any) done'"
  },
  "author": "Your Name",
  "license": "MIT",
  "devDependencies": {
    "eslint": "^8.0.0",
    "jest": "^29.0.0",
    "supertest": "^6.3.3"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF

# index.js
cat > index.js << 'EOF'
const app = require('./app');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF

# app.js
cat > app.js << 'EOF'
const express = require('express');
const sampleRouter = require('./routes/sample');

const app = express();

app.use(express.json());
app.use('/api', sampleRouter);

module.exports = app;
EOF

# routes/sample.js
cat > routes/sample.js << 'EOF'
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Hello, GitHub Actions!' });
});

module.exports = router;
EOF

# tests/sample.test.js
cat > tests/sample.test.js << 'EOF'
const request = require('supertest');
const app = require('../app');

describe('GET /api', () => {
  it('should return 200 OK', async () => {
    const res = await request(app).get('/api');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('message', 'Hello, GitHub Actions!');
  });
});
EOF

# GitHub Actions workflow

# README.md
cat > README.md << 'EOF'
# Sample Node.js App

This is a simple Node.js app set up for GitHub Actions CI/CD:
- Build
- Test
- Lint
- Deploy (placeholder)
EOF

echo "Project created successfully. Run 'npm install' inside sample-node-app to set it up."

