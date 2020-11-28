<template>
    <div>
        <b-navbar class="navbar" toggleable="sm" type="light">
            <b-navbar-brand href="/">NEMO Art Gallery</b-navbar-brand>
        </b-navbar>
        <div class="p-1">
            <Nuxt />
            <footer class="text-muted text-center text-small">
                <p class="mb-1">&copy; 2020 Company Name</p>
            </footer>
        </div>
    </div>
</template>
<style>
.navbar {
    box-shadow: 1px 3px 6px 0 #ccc;
    background-color: #eee;
}
.page-wrapper {
  height: 91vh;
}
.page-wrapper .title{
    font-weight: 300;
    font-size: 16pt;
    color: #555;
}

/* * { background-color: rgba(255,0,0,.2); }
* * { background-color: rgba(0,255,0,.2); }
* * * { background-color: rgba(0,0,255,.2); }
* * * * { background-color: rgba(255,0,255,.2); }
* * * * * { background-color: rgba(0,255,255,.2); }
* * * * * * { background-color: rgba(255,255,0,.2); }
* * * * * * * { background-color: rgba(255,0,0,.2); }
* * * * * * * * { background-color: rgba(0,255,0,.2); }
* * * * * * * * * { background-color: rgba(0,0,255,.2); } */
</style>