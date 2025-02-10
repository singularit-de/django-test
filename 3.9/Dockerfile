FROM ghcr.io/astral-sh/uv:0.5.1 AS uv

FROM python:3.9.21
COPY --from=uv /uv /uvx /bin/
