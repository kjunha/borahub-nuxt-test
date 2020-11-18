#!/bin/sh
npm install && npm run generate
exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf