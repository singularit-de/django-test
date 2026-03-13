FROM ghcr.io/astral-sh/uv:0.10.10 AS uv

FROM python:3.11.15
COPY --from=uv /uv /uvx /bin/
