# Installation

Install the mvp gem:

```
gem install minimum_viable_product
```

Then setup your project:

```
mvp new PROJECT
```

# Setup

## `.env`

Set your `.env` file up with your own variables

```
ROLLBAR_CLIENT_ACCESS_TOKEN=
ROLLBAR_SERVER_ACCESS_TOKEN=
SEGMENT_WRITE_KEY=
FACEBOOK_TRACKING_ID=
CANONICAL_HOST=
GOOGLE_ANALYTICS_ID=
HOTJAR_ID=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_S3_BUCKET=
SPOOF_IP=true
```

## Heroku

To setup deployment for heroku, first create the project:

```
heroku create PROJECT
```

You're probably going to want Database backups.  This will let you use `rake db:import`

```
heroku addons:create heroku-postgresql:hobby-dev
heroku pg:backups capture
```

You're also going to need to setup the buildpacks

```
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
```

Add a scheduled task to update your sitemaps: `rake sitemap:create_upload_and_ping`

# SEO

## Meta Properties

All meta fields are controlled via the `page` object.  Set attributes on this in order to get meta properties populated.  This is best done at the controller level.

### Available Properties

|Property|Description|Inheritance|
|---|---|---|
|`page.title`|   |   |
|`page.description`|   |   |
|`page.author`|   |   |
|`page.og_url`|   |   |
|`page.og_type`|   |   |
|`page.og_title`|   |`page.title`|
|`page.og_description`|   |`page.description`|
|`page.og_image`|   |   |
|`page.twitter_card`|   |   |   |

## Sitemaps

### Setup

Edit `config/sitemap.rb` with your own custom routes.

### Updating

Run `sitemap:refresh` in production to update Bing/Google with changes to the sitemap.  

Put this in a `cron` task or in Heroku Scheduler.

# Helpers

## Geolocation

By default, Geolocation of the session will automatically happen.  

You can access the session's geolocation in `request.location`.  

To test geolocation locally, set `SPOOF_IP=true` in your `.env`.

For more info see [Geocoder](https://github.com/alexreisner/geocoder).

## Bootstrap

### `row_groups_of`

Makes a series of row/col `div` elements based in group count.

```
<% row_groups_of(3, [1,2,3,4,5,6,7,8,9]) do |i| %>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h2 class="text-center"><%= i %></h2>
    </div>
  </div>
<% end %>
```
