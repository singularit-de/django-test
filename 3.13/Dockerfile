FROM ghcr.io/astral-sh/uv:0.10.3 AS uv

FROM python:3.13.12
COPY --from=uv /uv /uvx /bin/
