FROM ghcr.io/astral-sh/uv:0.10.6 AS uv

FROM python:3.12.12
COPY --from=uv /uv /uvx /bin/
