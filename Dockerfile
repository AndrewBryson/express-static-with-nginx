FROM smebberson/alpine-nginx-nodejs

ENV NODE_ENV=production NODE_PORT=4000

# Stream the nginx logs to stdout and stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Build the npm modules
ADD root/app/server/package.json /app/server/package.json
RUN cd /app/server && npm install --production

# Add the files (works with .dockerignore to exclude /app/node_modules, so the above npm build isn't replaced)
ADD root /
