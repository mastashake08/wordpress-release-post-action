# GitHub Action: Publish WordPress Post on Release

This GitHub Action automatically publishes a new WordPress post whenever you create a GitHub release.

## Usage

### Example Workflow
Create `.github/workflows/release-to-wordpress.yml` in your project:

```yaml
name: "Post to WordPress on Release"

on:
  release:
    types: [published]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - name: Use WordPress Release Post Action
        uses: your-github-username/wordpress-release-post-action@main
        with:
          wordpress_url: ${{ secrets.WORDPRESS_URL }}
          wordpress_username: ${{ secrets.WORDPRESS_USERNAME }}
          wordpress_app_password: ${{ secrets.WORDPRESS_APP_PASSWORD }}
          wordpress_category_id: "12"
