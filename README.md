# Schema dirtyness checker

This GitHub action enables you to verify whether your Forest Admin schema is up-to-date.
This tool is highly beneficial in preventing the merging of unsynchronized schemas with your code.

# Usage

```yaml
- name: Run Forest Admin Schema Dirtyness Checker
  uses: forestadmin/forestadmin-schema-dirtyness-checker
  with:
    # setup-infrastructure-command (optional): The command to set up your infrastructure, including your database or Docker environment.
    setup-infrastructure-command: 'your-command-to-setup-infrastructure.sh'
    
    # run-agent-command (required): The command to run your Forest Admin agent.
    run-agent-command: 'your-command-to-run-agent.sh'
    
    # log-when-setup (optional): A log that will be printed in your console once your server is fully started.
    log-when-setup: 'Successfully mounted on Standalone server'
    
    # log-when-agent-failed (optional): A log that will be printed if your server fails to start.
    log-when-agent-failed: 'Failed running'
    
    # schema-path (optional): The path to the .forestadmin-schema.json file. By default, it is set to .forestadmin-schema.json.
    schema-path: '.forestadmin-schema.json'
```

