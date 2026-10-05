FROM ghcr.io/astral-sh/uv:0.12.22 AS uv

FROM python:3.10.22
COPY --from=uv /uv /uvx /bin/
