exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(?!app)/
      order:
        before: [
          "vendor/scripts/underscore.math",
          "vendor/scripts/underscore.inflections",
          "vendor/scripts/jquery-validate",
        ]

    stylesheets:
      joinTo: 'stylesheets/app.css'

    templates:
      joinTo: 'javascripts/app.js'

