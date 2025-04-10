# ⚙️ Ansible 

No fluff. Pure wisdom. To outperform 99% of users.

---

## 🧠 1. CORE PLAYBOOK SKILLS

### ✅ Logic Mastery
- `when` with complex conditionals
- `set_fact` vs `vars` vs `defaults`
- `include_tasks`, `import_tasks`, `block`, `rescue`, `always`

### 🔁 Flow Control
- `pre_tasks`, `post_tasks`
- `tags`, `--start-at-task`
- `check_mode`, `diff`, `changed_when`, `failed_when`

---

## 📦 2. ROLES & COLLECTIONS

### Roles
```bash
ansible-galaxy init myrole
```
- Use full role structure (`tasks/`, `handlers/`, `templates/`, `vars/`, `defaults/`)
- Define dependencies in `meta/main.yml`
- Defaults allow external override

### Collections
```bash
ansible-galaxy collection init my_namespace.my_collection
```
- Package multiple roles/plugins/modules
- Version and publish

---

## 🧪 3. JINJA2 TEMPLATING

### Filters to Master
- `map`, `select`, `reject`, `unique`, `sort`
- `dict2items`, `items2dict`, `join`, `split`

### Lookup Examples
```yaml
lookup('env', 'HOME')
lookup('file', '/etc/passwd')
lookup('pipe', 'date')
```

---

## 🌍 4. DYNAMIC INVENTORY

### Cloud Native Inventory
- AWS: Use `boto3`, dynamic EC2 plugin
- GCP: Use service accounts and `gcp_compute`
- Azure: Native plugin with SPN credentials

```bash
ansible-inventory -i inventory.gcp.yml --list
```

---

## ⚙️ 5. ANSIBLE CONFIG + PERFORMANCE

### ansible.cfg Tweaks
```ini
[defaults]
forks = 50
pipelining = true
host_key_checking = false
timeout = 30
```

### Speed Tricks
- `gather_facts: false`
- Use `strategy: free` for async
- Tune batch size
- Use SSH control persist

---

## 🛡️ 6. ERROR HANDLING

### Reliable Patterns
```yaml
block:
  - name: Main task
    command: /bin/false
rescue:
  - debug: msg="Recovered!"
always:
  - debug: msg="Always runs"
```

### Register + Control
```yaml
- name: Try task
  shell: some_command
  register: output
  failed_when: "'ERROR' in output.stderr"
```

---

## 🔌 7. CUSTOM PLUGINS (PYTHON)

### Plugin Types
- **Filter**: Custom Jinja2 filters
- **Lookup**: Custom data fetchers
- **Callback**: Custom output/logging
- **Action**: Control-node logic

Create in:
```bash
<role>/plugins/filter/myfilter.py
```

---

## 🔐 8. VAULT AT SCALE

### Encrypt Secrets
```bash
ansible-vault encrypt secrets.yml
ansible-vault view secrets.yml
```

### Vault in CI
- Use `--vault-password-file`
- Integrate with HashiCorp Vault / AWS KMS

---

## 🏗️ 9. CI/CD INTEGRATION

### Lint + Test
```bash
ansible-lint playbook.yml
```

### Molecule Role Testing
```bash
molecule init role myrole
molecule test
```

### Pipeline Integration
- Use GitHub Actions / GitLab CI / Jenkins
- Run lint, syntax check, dry-run, deploy

---

## 🧠 10. ENTERPRISE GRADE PRACTICES

### Ansible Automation Platform (AAP)
- Centralized GUI for execution
- RBAC, Surveys, Job Templates, Workflows

### GitOps + IAC
- All playbooks in Git
- Tagging, branching, versioning
- Runbooks as code
- PR-based review + automated lint/test/deploy

---

## 🔥 THE ULTIMATE EDGE

- Fully idempotent playbooks
- Self-healing handlers
- Dynamic role inclusion
- Event-driven automation using **Rulebooks**
- Secure, scalable, and tested code

---

## 🏁 Final TL;DR

**To beat 99%:**

```text
Playbook Logic + Jinja2 + Roles + Dynamic Inventory +
Custom Plugins + Vault + Molecule + CI/CD + AAP + IAC Principles
```

