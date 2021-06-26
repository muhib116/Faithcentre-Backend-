<div class="under_construction">
    <div>
        <h1>This Page Is Under Construction</h1>
    </div>
</div>

<style>
    body{
        pointer-events: none;
        overflow-y: hidden;
    }
    .under_construction{
        background: #fff;
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        z-index: 150;
    }
    .under_construction>div{
        width: 100vw;
        height: 100vh;
        background: url(http://localhost/onnorokomshop/public/under_construction.svg);
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
        pointer-events: none;
    }
    .under_construction>div>h1{
        position: absolute;
        right: 0;
        top: 0;
        color: #ff5722;
        font-size: 2rem;
        line-height: 3rem;
        padding: 15px;
        margin: 0;
    }

    @media all and (max-width: 550px){
        .under_construction>div>h1{
            text-align: center;
            width: 100%;
            font-size: 1.5rem;
            line-height: 2rem;
        }
    }
</style>