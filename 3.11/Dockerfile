FROM ghcr.io/astral-sh/uv:0.9.1 AS uv

FROM python:3.11.13
COPY --from=uv /uv /uvx /bin/
