FROM ghcr.io/astral-sh/uv:0.6.8 AS uv

FROM python:3.12.9
COPY --from=uv /uv /uvx /bin/
