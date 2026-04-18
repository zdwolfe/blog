.PHONY: strip-exif

strip-exif:
	@command -v exiftool >/dev/null || { echo "exiftool not found: brew install exiftool"; exit 1; }
	@images=$$(find _posts assets -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) 2>/dev/null); \
	[ -n "$$images" ] || { echo "No images found."; exit 0; }; \
	exiftool -all= -overwrite_original $$images
