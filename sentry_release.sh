# Assumes you're in a git repository
export SENTRY_AUTH_TOKEN=889c8287291149cb9e5dd4cb447a594f6407c20a5da4431b8bcc5a754350ad6d
export SENTRY_ORG=artemis-consulting-inc
VERSION=$(sentry-cli releases propose-version)

# Create a release
sentry-cli releases new -p backend -p frontend $VERSION

# Associate commits with the release
sentry-cli releases set-commits --auto $VERSION

echo "version = $VERSION" > ./sentry_demo/version.py
git add  ./sentry_demo/version.py
git commit -m "Added version file"
