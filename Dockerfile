FROM oven/bun:alpine as builder
    WORKDIR /build
    COPY package.json ./
    RUN bun install

FROM oven/bun:alpine
    RUN apk --no-cache add tmux

    COPY --from=builder /build/node_modules /node_modules
    COPY src package.json ./

    CMD bun src/index.js