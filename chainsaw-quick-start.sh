# create a test directory
mkdir chainsaw-quick-start
cd chainsaw-quick-start

# create a ConfigMap
cat > configmap.yaml << EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: chainsaw-quick-start
data:
  foo: bar
EOF

# create test file
cat > chainsaw-test.yaml << EOF
apiVersion: chainsaw.kyverno.io/v1alpha1
kind: Test
metadata:
  name: quick-start
spec:
  steps:
  - try:
    # first operation: create the config map
    - apply:
        # file is relative to the test folder
        file: configmap.yaml
    # second operation: verify the config map exists and contains the expected data
    - assert:
        # file is relative to the test folder
        file: configmap.yaml
EOF
