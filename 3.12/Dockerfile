FROM ghcr.io/astral-sh/uv:0.12.15 AS uv

FROM python:3.12.14
COPY --from=uv /uv /uvx /bin/
