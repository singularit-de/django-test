FROM ghcr.io/astral-sh/uv:0.9.15 AS uv

FROM python:3.13.10
COPY --from=uv /uv /uvx /bin/
