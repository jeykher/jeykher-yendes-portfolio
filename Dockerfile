# PROJECT @ COMPANY

# STAGE 1 DEPENDENCIES INSTALLATION PROCESS

FROM node:18.1.0-alpine3.14 AS installer

RUN apk add --no-cache libc6-compat && \ 
    apk add nano -v --progress && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/node/app

COPY package.json ./

RUN yarn install --frozen-lockfile

# STAGE 2 APP BUILDING PROCESS

FROM node:18.1.0-alpine3.14  AS builder

RUN apk add --no-cache libc6-compat && \
    apk add nano -v --progress && \
    mkdir node_modules && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/node/app

COPY . .

COPY --from=installer /home/node/app/node_modules ./node_modules

COPY --from=installer /home/node/app/yarn.lock .

# ENV GENERATE_SOURCEMAP=false

# ENV NODE_OPTIONS=openssl-legacy-provider

RUN yarn build

# STAGE 3 DEPLOY PROCESS

FROM node:18.1.0-alpine3.14 AS deployer

RUN apk add --no-cache libc6-compat && \ 
    apk add nano -v --progress && \
    rm -rf /var/lib/apt/lists/* \
    addgroup --system --gid 1001 nodejs \
    adduser --system --uid 1001 nextjs

WORKDIR /home/node/app

ENV NODE_ENV production

# Uncomment the following line in case you want to disable telemetry during runtime.
# ENV NEXT_TELEMETRY_DISABLED 1

COPY --from=builder /home/node/app/public /hom/node/app/public

COPY --from=builder /home/node/app/package.json /hom/node/app/package.json

COPY --from=builder --chown=nextjs:nodejs /home/node/app/.next/standalone /home/node/app

COPY --from=builder --chown=nextjs:nodejs /home/node/app/.next/static /home/node/app/.next/static

USER nextjs

EXPOSE 3000

ENV PORT 3000

ENTRYPOINT [ "node", "server.js" ]
