FROM ghcr.io/astral-sh/uv:0.11.1 AS uv

FROM python:3.9.25
COPY --from=uv /uv /uvx /bin/
