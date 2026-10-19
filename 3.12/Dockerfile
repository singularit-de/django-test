FROM ghcr.io/astral-sh/uv:0.13.2 AS uv

FROM python:3.12.15
COPY --from=uv /uv /uvx /bin/
