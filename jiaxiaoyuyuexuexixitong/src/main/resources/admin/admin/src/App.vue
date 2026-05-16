<template>
  <div id="app" class="">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "app",
};
</script>

<style lang="scss">
@import "utils/theme.scss";/*引入全局颜色*/
*{
  padding: 0;
  margin:0;
}
html,body{
  width: 100%;
  height: 100%;
}
#app{
  height:100%;
}
body {
  padding: 0;
  margin: 0;
  font-family: Inter, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  color: var(--publicTextColor);
  background: linear-gradient(180deg, var(--publicPageBg) 0%, #f7fbff 100%);
}

button,
input,
textarea,
select {
  font-family: inherit;
}
</style>
