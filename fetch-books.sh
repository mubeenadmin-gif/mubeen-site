#!/usr/bin/env bash
# Fetch the book PDFs into the published site at build time.
# A book that cannot be fetched falls back to the archive.org rewrite in _redirects.
mkdir -p books
ok=0; fail=0
get(){ for i in 1 2 3 4 5; do if curl -fsSL --http1.1 --retry 3 --retry-all-errors --connect-timeout 20 -A "Mozilla/5.0 (Netlify build; mubeenarabic.org)" -o "$1.part" "$2"; then mv "$1.part" "$1"; ok=$((ok+1)); return 0; fi; echo "retry $i for $1"; sleep $((i*5)); done; rm -f "$1.part"; echo "WARN: could not fetch $1, using fallback"; fail=$((fail+1)); }
get "books/madinah-1.pdf" "https://archive.org/download/20191011_20191011_0820/%D8%AF%D8%B1%D9%88%D8%B3%20%D8%A7%D9%84%D9%84%D8%BA%D8%A9%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9%20%D9%84%D8%BA%D9%8A%D8%B1%20%D8%A7%D9%84%D9%86%D8%A7%D8%B7%D9%82%D9%8A%D9%86%20%D8%A8%D9%87%D8%A7%20-%20%D8%A7%D9%84%D8%AC%D8%B2%D8%A1%20%D8%A7%D9%84%D8%A3%D9%88%D9%84_text.pdf"
get "books/madinah-2.pdf" "https://archive.org/download/20191011_20191011_0820/%D8%AF%D8%B1%D9%88%D8%B3%20%D8%A7%D9%84%D9%84%D8%BA%D8%A9%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9%20%D9%84%D8%BA%D9%8A%D8%B1%20%D8%A7%D9%84%D9%86%D8%A7%D8%B7%D9%82%D9%8A%D9%86%20%D8%A8%D9%87%D8%A7%20-%20%D8%A7%D9%84%D8%AC%D8%B2%D8%A1%20%D8%A7%D9%84%D8%AB%D8%A7%D9%86%D9%8A_text.pdf"
get "books/qasas-al-nabiyyin.pdf" "https://archive.org/download/20241219_20241219_1856/%D9%82%D8%B5%D8%B5%20%D8%A7%D9%84%D9%86%D8%A8%D9%8A%D9%8A%D9%86%20%D9%84%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84.pdf"
get "books/al-amthilah.pdf" "https://archive.org/download/emsile_kitabi/EMS%C4%B0LE.pdf"
get "books/al-bina.pdf" "https://archive.org/download/hgwfhdh/%D9%85%D8%AA%D9%86%20%D8%A7%D9%84%D8%A8%D9%86%D8%A7%D8%A1%20%D9%81%D9%8A%20%D8%B9%D9%84%D9%85%20%D8%A7%D9%84%D8%B5%D8%B1%D9%81%20%D9%88%D9%85%D8%B9%D9%87%20%D8%A7%D9%84%D9%85%D8%A8%D8%A7%D8%AF%D8%A6%20%D8%A7%D9%84%D8%B9%D8%B4%D8%B1%D8%A9%20%D9%88%D8%B4%D8%B1%D8%AD%20%D8%A7%D9%84%D9%85%D9%8A%D8%B2%D8%A7%D9%86%20%D9%88%D8%A7%D8%AE%D8%AA%D8%B5%D8%A7%D8%B1%20%D9%85%D8%AA%D9%86%20%D8%A7%D9%84%D8%A8%D9%86%D8%A7%D8%A1%20%D9%81%D9%8A%20%D8%AC%D8%AF%D8%A7%D9%88%D9%84%20%D8%B6%D8%A8%D8%B7%20%D9%84%D8%A3%D8%A8%D9%8A%20%D8%B2%D9%8A%D8%A7%D8%AF%20%D9%85%D8%AD%D9%85%D8%AF%20%D8%B3%D8%B9%D9%8A%D8%AF%20%D8%A7%D9%84%D8%A8%D8%AD%D9%8A%D8%B1%D9%8A.pdf"
get "books/al-maqsud.pdf" "https://archive.org/download/4MAKSUD/4_MAKSUD.pdf"
get "books/al-awamil.pdf" "https://archive.org/download/3AVAMIL/3_AVAMIL.pdf"
echo "books fetched: $ok, fallback: $fail"
ls -la books
exit 0
