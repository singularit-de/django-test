FROM ghcr.io/astral-sh/uv:0.6.14 AS uv

FROM python:3.13.3
COPY --from=uv /uv /uvx /bin/
