QEMU = qemu-system-x86_64
IMAGE = debian.img
COMMON_OPTIONS = -enable-kvm \
-boot menu=on \
-net nic \
-net user,hostfwd=tcp::2270-:22 \
-drive file=${IMAGE} \
-m 2G \
-cpu host \
-vga std

ISO = debian-12.11.0-amd64-netinst.iso

.PHONY: all
all:
	@echo "Ошибка: необходимо указать цель. Используйте 'make install' или 'make run'."
	@exit 1

.PHONY: install
install:
	@echo "Установка образа debian/12"
	${QEMU} -cdrom ${ISO} ${COMMON_OPTIONS} 

.PHONY: run
run:
	@echo "Запуск образа debian/12"
	${QEMU} ${COMMON_OPTIONS} 

.PHONY: create
create:
	qemu-img create -f qcow2 ${IMAGE} 20G
