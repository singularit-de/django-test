FROM ghcr.io/astral-sh/uv:0.6.4 AS uv

FROM python:3.12.9
COPY --from=uv /uv /uvx /bin/
