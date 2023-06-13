<template>
  <div id="container" style="width: 1225px; margin: 5px auto">
    <el-row :gutter="20">
      <el-col :span="24">
        <div class="info">
          <el-row>
            <el-card shadow="hover">
              <div slot="header" class="clearfix" style="text-align: center">
                <span>{{ item.biaoti }}</span>
              </div>
              <div v-html="item.neirong"></div>
            </el-card>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  data() {
    return {
      item: {
        user: {},
        shezhang: {},
        shetuan: {},
      }, // 资讯详细信息
    };
  },
  watch: {
    $route(to, from) {
      this.$router.go(0);
    },
  },
  created() {
    let id = this.$route.params.id;
    this.id = id;
    this.getDetails(id);
  },
  methods: {
    // 获取资讯详细信息
    getDetails(val) {
      this.$axios
        .get("/api/front/getxinwentongzhi/" + val)
        .then((res) => {
          this.item = res.data.data;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
  },
};
</script>
<style>
</style>
