
Description - To put info about the pipeline gonna build it 
## Check in
## 1. Discard old builds

- **When to use:** In any active CI/CD pipeline, especially those that run frequently (e.g., on every pull request) or generate massive build outputs.
    
- **Real-Time Example:** You have an Android mobile application pipeline that runs 20 times a day. Each run generates a `50MB` `.apk` file. If you don't check this box, you will consume **1 GB of disk space every day**. By checking **Discard old builds** and setting the _Max # of builds to keep_ to `10`, Jenkins will automatically delete the oldest `.apk` files, keeping your server storage stable and preventing a critical disk-space crash.
    

## 2. Do not allow concurrent builds

- **When to use:** When your pipeline deploys to a shared single-instance environment, or when running simultaneous builds will cause resource conflicts.
    
- **Real-Time Example:** You have a deployment pipeline that deploys code to your **Staging/QA server**. If Developer A pushes code, and 30 seconds later Developer B pushes code, you don't want two deployment scripts running at the exact same time trying to overwrite the exact same database or server files. Checking this ensures Developer B's deployment safely waits in a queue until Developer A's deployment finishes.
    

## 3. GitHub hook trigger for GITScm polling

- **When to use:** For standard, automated Continuous Integration (CI) where you want instant feedback as soon as code changes.
    
- **Real-Time Example:** Your development team is working on a feature branch. The moment a developer clicks **"Merge"** on a Pull Request in GitHub, GitHub sends a fast webhook notification to Jenkins. Jenkins instantly spins up the pipeline to run unit tests and check if the merge broke the build, giving the team feedback within minutes without anyone needing to log into Jenkins manually.
    

## 4. This project is parameterized

- **When to use:** When you need a single pipeline to be flexible and accept user inputs, rather than creating 5 different pipelines for 5 different scenarios.
    
- **Real-Time Example:** You have a pipeline that deploys a microservice. Instead of creating three separate Jenkins jobs called `deploy-dev`, `deploy-stage`, and `deploy-prod`, you check **This project is parameterized** and add a _Choice Parameter_ named `ENVIRONMENT` with the options `[dev, staging, production]`. Now, when an engineer clicks "Build with Parameters," they simply select the target environment from a dropdown menu.
    

## 5. Build periodically

- **When to use:** For routine maintenance, data backups, or heavy test suites that take too long to run during the workday.
    
- **Real-Time Example:** You have a massive **End-to-End (E2E) Automation Test Suite** that takes 4 hours to execute. Running this on every single code commit would paralyze the development workflow. Instead, you check **Build periodically** and schedule it using cron syntax (`H 0 * * *`) to run automatically every night at midnight. The team wakes up the next morning to a fresh test report.
---
## 1. Do not allow the pipeline to resume if the controller restarts

- **When to use:** When your pipeline handles time-sensitive, sequential, or destructive operations where an unexpected pause and blind retry could break things.
    
- **Real-Time Example:** You have a pipeline that runs an active database data migration script. If the Jenkins controller server undergoes an unannounced reboot midway through, you do **not** want Jenkins waking back up minutes later and trying to pick up mid-execution, which could result in corrupt or duplicated data. Checking this box guarantees that if Jenkins crashes, the job instantly fails, forcing a clean, manual intervention.
    

## 2. Pipeline speed/durability override

- **When to use:** When you have high-frequency test pipelines that generate massive amounts of log data and you want to reduce disk I/O to speed up execution times, accepting the risk that a sudden server crash means losing that run's history.
    
- **Real-Time Example:** Your QA team runs a massive matrix of **100 ephemeral automated UI tests** on every single commit. Writing every single step's state to the physical server disk slows the execution down. By overriding the durability setting to **"Performance-optimized"** (surviving restarts is not required), the tests run significantly faster, freeing up Jenkins resources.
    

## 3. Preserve stashes from completed builds

- **When to use:** When you use the `stash` and `unstash` commands in your pipeline code to pass files between different build stages (or different servers), and you need to debug or reuse those specific files _after_ the build has finished.
    
- **Real-Time Example:** Stage 1 of your pipeline builds a complex binary file. Stage 2 takes that binary and runs security scans on it. Normally, Jenkins deletes the stashed binary the second the pipeline ends. By checking this, you preserve that exact compiled binary so that engineers can download it directly from the completed build history for manual debugging.
    

## 4. This project is parameterized

- **When to use:** When a single pipeline needs to act dynamically based on user inputs at the moment it is triggered.
    
- **Real-Time Example:** You have a deployment pipeline. Instead of hardcoding the deployment targets, you check this box and add a **Choice Parameter** called `DEPLOY_ENVIRONMENT` with options `[Dev, QA, Production]`, and a **Text Parameter** called `RELEASE_VERSION`. When an operator clicks "Build", Jenkins prompts them with a form to pick the environment and type in the specific version string they want to deploy.
    

## 5. Throttle builds

- **When to use:** When your pipeline interacts with external APIs, licenses, or environments that have strict rate limits or performance caps, preventing the job from running too many times back-to-back.
    
- **Real-Time Example:** You have a pipeline that runs integration tests against a legacy external credit-score API that bills you per call or crashes if hit with more than 2 requests per minute. If a team of 10 developers all merge their code at 5:00 PM, **Throttle builds** allows you to enforce a strict rule (e.g., "maximum of 1 execution every 2 minutes") ensuring your Jenkins jobs don't break or overload the external API vendor.


# Triggers
Here is the real-world breakdown, utility, and concrete examples for the **Triggers** section. These options determine exactly what events will kick off your automated pipeline.

## 1. Build after other projects are built

- **When to use:** When you have a chain of dependent projects (a pipeline workflow cascade) where Job B should only run if Job A completes successfully.
    
- **Real-Time Example:** You have two separate Jenkins jobs: One called `Compile-Core-App` and another called `Run-Heavy-Automation-Tests`. You don't want to waste server resources running automation tests if the app fails to compile. By configuring `Run-Heavy-Automation-Tests` to **Build after other projects are built** and targeting `Compile-Core-App`, Jenkins will automatically start your test suite the second the core app compiles successfully.
    

## 2. Build periodically

- **When to use:** When you need a job to execute automatically on a strict, predictable time schedule, completely independent of whether code changes have occurred. It uses standard cron-tab formatting.
    
- **Real-Time Example:** You need to generate a weekly compliance and vulnerability report for your security team, or you want to trigger a massive data cleanup script every night. You check this box and enter `0 0 * * *` (which means "every night at midnight"). Jenkins will execute the pipeline perfectly on time, every single day.
    

## 3. GitHub hook trigger for GITScm polling

- **When to use:** This is the modern industry standard for **Continuous Integration (CI)**. Use this when you want your pipeline to run instantly the second code is pushed or a Pull Request is merged.
    
- **Real-Time Example:** A developer finishes fixing a bug and runs `git push origin main`. GitHub receives the code and immediately sends a lightweight notification web request (a Webhook) to your Jenkins server. Jenkins hears this ping and instantly starts the pipeline to test and deploy the fresh code. It provides instantaneous feedback to the team.
    

## 4. Poll SCM (Source Control Management)

- **When to use:** Use this as a fallback alternative to Webhooks if your Jenkins server is locked down inside a private network/firewall where external tools like GitHub or GitLab cannot send incoming pings to it.
    
- **Real-Time Example:** Your Jenkins instance is hosted deep inside a highly secure corporate network that cannot accept traffic from the public internet. Because GitHub cannot "ping" your Jenkins server, you configure **Poll SCM** to check the repository every 15 minutes (`*/15 * * * *`). Every 15 minutes, Jenkins actively reaches out to GitHub and asks, _"Hey, is there any new code?"_ If yes, it pulls the changes and builds; if no, it goes back to sleep.

---
## And then the finally the pipeline code section there we speak groovy to the jenkins to make our jobs done


There also we have option to write the code or take from scm source code management 
github
Option are 
Pipeline script 
Pipeline script from SCM

you can take sample by changing the dropdown in the right corner of the coding box

---
# End of Configure 

## Advanced 
## 1. Quiet period

- **What it does:** It forces Jenkins to wait for a specific number of seconds before actually starting a build once it has been triggered.
    
- **Why it's useful:** It acts as a "de-bounce" mechanism to prevent multiple rapid commits from triggering separate back-to-back builds.
    

### Real-Time Example

Imagine a developer pushes a code commit, realizes they made a typo in a configuration file 5 seconds later, and pushes a second commit.

- **Without a Quiet Period:** Jenkins would instantly trigger Build #1, and then immediately queue Build #2 right after it, wasting server resources on an outdated build.
    
- **With a Quiet Period (e.g., set to 60 seconds):** Jenkins receives the first trigger, pauses, and starts a countdown. When the second commit arrives 5 seconds later, Jenkins resets the timer. It safely waits until 60 seconds of complete "silence" have passed before compiling the final, combined code changes into a single build execution.
    

## 2. Display Name

- **What it does:** Allows you to give this job a custom, reader-friendly name that will be displayed everywhere in the Jenkins dashboard UI, without changing the actual underlying folder name on the server's hard drive.
    
- **Why it's useful:** Jenkins job names usually cannot contain spaces, special characters, or uppercase variations cleanly because they double as URL paths (e.g., `my-core-backend-api`). The **Display Name** lets you make it pretty for your team (e.g., `✨ Core Backend Production API ✨`) while keeping the system folder name simple and safe for scripts.