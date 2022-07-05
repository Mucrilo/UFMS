let cur;


function f() {
    let cur = document.getElementById('expressao').value;
    console.log('js ');
    fetch("http://localhost:88/app.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        },
        body: `cur=${cur}`,
    })
        .then((response) => response.text())
        .then((res) => (document.getElementById("result").innerHTML = res));

    if (cur != '')
        document.getElementById('expressao').value = '';
}

function escreve(val) {
    let expressao = document.getElementById('expressao').value;

    if (val == '<-') {
        expressao = expressao.slice(0, -1);
        document.getElementById('expressao').value = expressao;
        cur = expressao;
        return true;
    }
    document.getElementById('expressao').value = expressao + val;
    cur = expressao;
    return true;
}