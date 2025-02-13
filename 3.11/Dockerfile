FROM ghcr.io/astral-sh/uv:0.5.31 AS uv

FROM python:3.11.11
COPY --from=uv /uv /uvx /bin/
