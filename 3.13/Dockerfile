FROM ghcr.io/astral-sh/uv:0.11.19 AS uv

FROM python:3.13.13
COPY --from=uv /uv /uvx /bin/
