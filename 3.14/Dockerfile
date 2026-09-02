FROM ghcr.io/astral-sh/uv:0.12.9 AS uv

FROM python:3.14.7
COPY --from=uv /uv /uvx /bin/
