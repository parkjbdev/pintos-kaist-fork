FROM debian:bookworm

# 환경 변수 설정
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 설치 (x86_64 환경)
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libc6-dev \
    qemu-system-i386 \
    qemu-system-x86 \
    perl \
    binutils \
    make \
    gdb \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /pintos

# 소스 코드 복사
COPY . .

# Pintos 유틸리티에 실행 권한 부여
RUN chmod +x utils/pintos utils/pintos-mkdisk utils/backtrace

# PATH에 utils 디렉토리 추가
ENV PATH="/pintos/utils:${PATH}"

# 기본 명령어
CMD ["/bin/bash"]
