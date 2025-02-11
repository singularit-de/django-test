FROM ghcr.io/astral-sh/uv:0.5.30 AS uv

FROM python:3.9.21
COPY --from=uv /uv /uvx /bin/
