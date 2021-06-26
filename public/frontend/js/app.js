/* trending news start */
let innerText = document.querySelectorAll('.text_wrapper .inner_text');
if (innerText) {
    innerText.forEach(_innerText => {

        /* make clone of first child and push as last child start */
        let firstText = _innerText.firstElementChild.cloneNode(true);
        _innerText.appendChild(firstText);
        /* make clone of first child and push as last child end */


        let i               = 1,
            intervalTime    = 4000,
            translateAmount = 25;

        setInterval(() => {
            let step = _innerText.childElementCount;
            _innerText.style.transform = `translateY(-${translateAmount * i}px)`;
            _innerText.style.transition = `0.5s ease-in-out`;
            if (i == step) {
                _innerText.style.transition = `0s`;
                _innerText.style.transform = `translateY(0px)`;
            }

            i = (i < step) ? (i + 1) : 1;
        }, intervalTime);
    });
}
/* trending news end */