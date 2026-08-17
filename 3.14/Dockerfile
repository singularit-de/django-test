FROM ghcr.io/astral-sh/uv:0.12.5 AS uv

FROM python:3.14.7
COPY --from=uv /uv /uvx /bin/
