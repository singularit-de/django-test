FROM ghcr.io/astral-sh/uv:0.9.9 AS uv

FROM python:3.11.14
COPY --from=uv /uv /uvx /bin/
