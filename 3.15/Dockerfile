FROM ghcr.io/astral-sh/uv:0.13.9 AS uv

FROM python:3.15.1
COPY --from=uv /uv /uvx /bin/
