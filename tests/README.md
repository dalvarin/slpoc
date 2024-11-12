# Ansible Testing Tools

## Monkeyble

### Monkeyble Documentation

- <https://hewlettpackard.github.io/monkeyble/>
- <https://github.com/HewlettPackard/monkeyble>

### Examples

Please, review the files in <Monkeyble/> folder

```bash
ANSIBLE_CONFIG="ansible.cfg" ansible-playbook ../../playbooks/<playbooks_subfolder>/<playbook_to_test>.yml -e "@monkeyble_scenarios.yml" -e "monkeyble_scenario=validate_test_1"
```

## Inspec

### Inspec Documentation

- <https://www.inspec.io/>

```bash
inspec exec tests/functional_tests.rb --reporter cli junit:testresults.xml html:report.html --chef-license accept
```

## Pytest - TestInfra

To be completed
