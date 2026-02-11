FROM ghcr.io/astral-sh/uv:0.10.2 AS uv

FROM python:3.9.25
COPY --from=uv /uv /uvx /bin/
