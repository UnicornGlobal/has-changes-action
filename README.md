# Has Changes

GitHub action for checking if the repo is dirty (has uncommitted changes).

## Why?

This is useful for things like checking if you need to open a pull
request for any changes that may be introduced through another action.

## How?

Add a step in a job after any steps whose code changes you want to check.

You will then be able to check the status in subsequent steps.

You do this by checking if `changed` is equal to `1`.

The value will be 0 if no code has been changed by any previous steps.

You can print list of all changes by printing `changes` variable in the step. 

## Example

```yaml
name: Has Changes
jobs:
  has-changes:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        ref: ${{ github.head_ref }}
    - name: Make changes
      run: touch change.temp
    # This step will evaluate the repo status and report the change
    - name: Check if there are changes
      id: changes
      uses: UnicornGlobal/has-changes-action@v1.0.11
    # You can now access a variable indicating if there have been changes
    - name: Process changes
      if: steps.changes.outputs.changed == 1
      run: echo "Changes exist"
    # You can print list of changes if needed
    # run: echo "Changes exist: " && echo "${{ steps.changes.outputs.changes }}"
```

The example shows that adding a step to check the status will expose the
status on the `${{ steps.changes.outputs.changed }}` variable.

The `steps.changes` is defined by the `id: changes`. If you change the id
value then the step name must change too (as it references the id).
