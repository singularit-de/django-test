FROM ghcr.io/astral-sh/uv:0.12.19 AS uv

FROM python:3.10.21
COPY --from=uv /uv /uvx /bin/
