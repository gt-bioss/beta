for x in $(find -name '*.html'|cut -d/ -f2-); do
    cat > ${x} <<EOF
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="refresh" content="0; URL=https://www.bioss-cnrs.fr/old/${x}">
</head>
<body>
Redirecting to <a href="/old/${x}">old website</a>
</body>
</html>
EOF
done
