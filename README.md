# AD-Kernel

개인적인 공부로 x86 커널을 만들어 보았습니다.
A personal project to build an x86 kernel from scratch.

## 개발 환경 / Environment

- NASM
- GCC (32-bit)
- GNU ld
- QEMU

## 빌드 & 실행 / Build & Run

```bash
make      # 빌드 / build
make run  # QEMU에서 실행 / run in QEMU
```

## 구현 현황 / Progress

- [x] 부트로더 (16비트 → 32비트 보호 모드 전환) / Bootloader (16-bit → 32-bit protected mode switch)
- [x] VGA 텍스트 드라이버 / VGA text driver
- [ ] IDT + 인터럽트 설정 / IDT + interrupt setup
- [ ] PIC + 타이머(PIT) / PIC + timer (PIT)
- [ ] 키보드 드라이버 / Keyboard driver
- [ ] 메모리 관리 (페이징) / Memory management (paging)
