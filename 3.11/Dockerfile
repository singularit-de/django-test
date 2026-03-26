FROM ghcr.io/astral-sh/uv:0.11.2 AS uv

FROM python:3.11.15
COPY --from=uv /uv /uvx /bin/
