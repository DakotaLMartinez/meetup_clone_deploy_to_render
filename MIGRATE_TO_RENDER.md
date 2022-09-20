# Migration to Render

## Resources

- [Render.com guide for migrating from Heroku](https://render.com/docs/migrate-from-heroku)

## Steps

### 1. Generate a `Dockerfile.render` and `render.yaml`

```bash
heroku plugins:install @renderinc/heroku-import
```

```bash
heroku render:import --app meetup-clone-042522
```

Add the postgresql database addon that Heroku created by pressing <space> and then <enter> to proceed

You'll be prompted to

> Create render.yaml, .render-buildpacks.json, and Dockerfile.render? This will overwrite any existing files with the same name. (y/n): 

type y

You'll see a printout like this:

=== Environment variables excluded from render.yaml
The following environment variables were not included in the generated
  render.yaml file because they potentially contain secrets. You may need to
  manually add them to your service in the Render Dashboard.

- DATABASE_URL: *************
- SECRET_KEY_BASE: ************

=== Follow these steps to complete import of service(s) and database(s) to Render
1. Add, commit, and push the generated .render-buildpacks.json, render.yaml and Dockerfile.render to GitHub or GitLab.
2. Go to https://dashboard.render.com/select-repo?type=blueprint
3. Search for and select this repository.
4. Verify the plan showing the resources that Render will create, and
   then click 'Create New Resources'.
5. After the resources are deployed, you may need to manually add
   the above environment variables to your Web Service in the Render Dashboard.
   They were not included in the generated render.yaml because they potentially
   contain secrets.