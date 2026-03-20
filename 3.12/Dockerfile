FROM ghcr.io/astral-sh/uv:0.10.12 AS uv

FROM python:3.12.13
COPY --from=uv /uv /uvx /bin/
