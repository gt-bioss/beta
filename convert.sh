for x in $(find -name *.html|cut -d/ -f2-); do
    out=$(basename "${x/.html/.md}")
    awk '/insert the page/,/content_footer/ {print}' "${x}" | pandoc --from html --to markdown -|head -n-2>${out}.1
    title="$(head -n1 ${out}.1)"
    title="${title:2}"
    cat > ${out} <<EOF
---
title: "${title}"
date: XXXX
url: /manif/${x}
summary: ""
categories: "Manifestations"
---

EOF
    tail -n +2 ${out}.1 >> ${out}
    rm -f ${out}.1
done
