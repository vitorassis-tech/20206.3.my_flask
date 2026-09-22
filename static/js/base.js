// Bloqueia o reenvio de formulários  se recarregar a página com F5 
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}
