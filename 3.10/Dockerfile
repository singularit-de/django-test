FROM ghcr.io/astral-sh/uv:0.9.20 AS uv

FROM python:3.10.19
COPY --from=uv /uv /uvx /bin/
