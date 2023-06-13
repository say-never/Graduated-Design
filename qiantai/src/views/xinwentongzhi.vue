<template>
  <div class="goods" id="goods" name="goods">
    <!-- 分类标签 -->
    <el-row>
      <h3 class="huodong-title">站内资讯</h3>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card shadow="hover">
          <div class="info">
            <ul class="info-ul">
              <li
                class="info-item"
                style="border-bottom: #c9c9c9 1px dashed"
                v-for="item in xinwentongzhis"
                :key="item.id"
              >
                <router-link
                  :to="`/xinwentongzhidetail/` + item.id"
                  style="
                    display: flex;
                    justify-content: space-between;
                    width: 100%;
                  "
                >
                  <div class="info-item-left" v-text="item.biaoti"></div>
                  <div class="info-item-right" v-text="item.addtime"></div>
                </router-link>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  data() {
    return {
      xinwentongzhis: [],
    };
  },
  created() {
    this.getxinwentongzhi();
  },
  activated() {
  },
  watch: {
    // 监听路由变化，更新路由传递了搜索条件
    $route: function (val) {
      if (val.path == "/goods") {
        if (val.query.productName != undefined) {
          this.activeName = "-1";
          this.current = 1;
          this.total = 0;
          //  this.productName = val.query.productName;
        }
      }
    },
  },
  methods: {
    // 向后端请求分类列表数据
    getxinwentongzhi() {
      this.$axios
        .get("/api/front/xinwentongzhi", {})
        .then((res) => {
          this.xinwentongzhis = res.data.data;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
  },
};
</script>

<style scoped>
@import "../assets/css/index.scss";
* {
  background: #fff;
  color: #444;
  font-family: "Open Sans", sans-serif;
}
.huodong-title {
  font-size: 16px;
  color: #333;
  line-height: 40px;
  height: 40px;
  margin: 0;
  padding: 0;
  text-decoration: none;
  display: block;
  position: relative;
  transition: 0.15s ease-out;
  font-weight: 700;
  text-align: center;
}
.goods {
  background-color: #f5f5f5;
  max-width: 1225px;
  margin: 0 auto;
}
.goods .breadcrumb {
  height: 50px;
  background-color: white;
}
.goods .breadcrumb .el-breadcrumb {
  width: 1225px;
  line-height: 30px;
  font-size: 16px;
  margin: 0 auto;
}
/* 面包屑CSS END */

/* 分类标签CSS */
.goods .nav {
  background-color: white;
}
.goods .nav .product-nav {
  width: 1225px;
  height: 40px;
  line-height: 40px;
  margin: 0 auto;
}
/* 分类标签CSS END */

/* 主要内容区CSS */
.goods .main {
  margin: 0 auto;
  max-width: 1225px;
}
.goods .main .list {
  min-height: 650px;
  padding-top: 14.5px;
  margin-left: -13.7px;
  overflow: auto;
}
.goods .main .pagination {
  height: 50px;
  text-align: center;
}
.goods .main .none-product {
  color: #333;
  margin-left: 13.7px;
}
.info-item {
  display: flex;
  font-size: 13px;
  color: #606266;
  height: 28px;
  line-height: 28px;
}
.info-item :hover {
  cursor: pointer;
}
</style>
