Example code of WorkFLow in Github Actions
```
# 1. METADATA
name: Production Pipeline

# 2. TRIGGERS (When to run)
on:
  push:
    branches: [main, 'feature/*']
    paths-ignore: ['**.md']
  pull_request:
    branches: [main]
  workflow_dispatch: # Manual trigger

# 3. GLOBAL CONFIG (Security & Environment)
permissions:
  contents: read
  id-token: write

env:
  GLOBAL_VAR: "shared-value"

# 4. EXECUTION BLOCKS (What to run)
jobs:
  build-and-test:
    runs-on: ubuntu-latest
    timeout-minutes: 15
    
    # Environment variables scoped to this specific job
    env:
      JOB_VAR: "job-specific-value"

    # Sequential execution tasks within this runner
    steps:
      - name: Clone Repository
        uses: actions/checkout@v4

      - name: Use Environment Variable Safely
        run: echo "The value is $JOB_VAR"

  deploy:
    needs: build-and-test # Sequential dependency
    if: github.ref == 'refs/heads/main' # Conditional check
    runs-on: ubuntu-latest
    
    steps:
      - name: Deploy Step
        run: echo "Deploying to production..."
```

